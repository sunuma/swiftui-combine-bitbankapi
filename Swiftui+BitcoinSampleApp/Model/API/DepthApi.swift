//
//  DepthApi.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/08.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import Alamofire
import Combine

//sourcery: AutoMockable
protocol DepthApiProtocol {
    func excute(currencyPair: CurrencyPair) -> Future<DepthEntity, ApiError>
}

struct DepthApi: DepthApiProtocol {
    func excute(currencyPair: CurrencyPair) -> Future<DepthEntity, ApiError> {
        let request = DepthApiRequest(currencyPair: currencyPair)
        return HttpsConnectPublisher.publish(request)
    }
}

struct DepthApiRequest: BitbankApiRequest {
    var apiType: ApiType = .typePublic
    typealias Response = DepthEntity
    var method: HTTPMethod { return .get }
    var path: String { return "/\(currencyPair.rawValue)/depth" }
    private var currencyPair: CurrencyPair

    init(currencyPair: CurrencyPair) {
        self.currencyPair = currencyPair
    }
}
