//
//  BitbankApiRequest.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/08.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import Alamofire

enum ApiType: Int {
    case typePublic
    case typePrivate
}

protocol BitbankApiRequest: BaseRequest {
    var apiType: ApiType { get set }
}

extension BitbankApiRequest {
    var baseUrl: URL {
        let base = apiType == .typePublic ? "https://public.bitbank.cc" : "https://api.bitbank.cc/v1"
        return URL(string: base + path)!
    }

    var httpHeaderFields: HTTPHeaders? {
        switch apiType {
        case .typePublic:
            return nil
        case .typePrivate:
            return [
                HTTPHeader(name: "ACCESS-KEY", value: ""),
                HTTPHeader(name: "ACCESS-NONCE", value: ""),
                HTTPHeader(name: "ACCESS-SIGNATURE", value: "")
            ]
        }
    }

    var parameters: BaseParam? { return nil }
}
