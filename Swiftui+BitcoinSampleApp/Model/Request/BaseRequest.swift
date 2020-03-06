//
//  BaseRequest.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/08.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import Alamofire

protocol BaseRequest {
    associatedtype Response
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: BaseParam? { get }
    var httpHeaderFields: HTTPHeaders? { get }
    func response(from data: Data) -> Response?
}

extension BaseRequest where Response: Decodable {
    func response(from data: Data) -> Response? {
        let decoder = JSONDecoder()
        do {
            //appDump(String(data: data, encoding: .utf8))
            return try decoder.decode(Response.self, from: data)
        } catch {
            appPrint("request error = \(error.localizedDescription)")
            fatalError()
        }
    }
}

///　リクエストパラメータープロトコル
protocol BaseParam {
    func getParameter() -> [String: Any]
}
