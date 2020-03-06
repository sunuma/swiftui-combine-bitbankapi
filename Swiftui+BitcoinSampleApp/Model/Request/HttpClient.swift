//
//  HttpClient.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/08.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import Alamofire
import Combine
import RxSwift

struct HttpsConnectPublisher {
    static func publish<T: BaseRequest>(_ request: T) -> Future<T.Response, ApiError> {
        let endPoint    = request.baseUrl
        let params      = request.parameters?.getParameter()
        let headers     = request.httpHeaderFields
        let method      = request.method

        return Future<T.Response, ApiError> { promise in
            let req = AF.request(endPoint,
                                 method: method,
                                 parameters: params,
                                 encoding: URLEncoding.default,
                                 headers: headers)
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        if let data = response.data, let model = request.response(from: data) {
                            promise(.success(model))
                        } else {
                            let message = "😱 failed to \(String(describing: T.Response.self)).class json parse."
                            appPrint(message)
                            promise(.failure(ApiError.parseError(message)))
                        }
                    case .failure(let error):
                        appDump(error)
                        promise(.failure(ApiError.resultError(error)))
                    }
            }
            req.resume()
            appPrint("🍣 request = \(req.description)")
        }
    }
}

enum ApiError: Error {
    case resultError(Error)
    case invalidResponse(String?)
    case parseError(String?)
    case castError(String?)

    func errorDescription() -> String {
        var message = ""
        switch self {
        case let .resultError(error):
            message = "😱 Result error = \(error.localizedDescription) "
        case .invalidResponse(let msg):
            message = "😱 Invalid response: "
            if let value = msg { message += value }
        case .parseError(let msg):
            message = "😱 Parse error: "
            if let value = msg { message += value }
        case .castError(let msg):
            message = "😱 Cast error: "
            if let value = msg { message += value }
        }
        return message
    }
}
