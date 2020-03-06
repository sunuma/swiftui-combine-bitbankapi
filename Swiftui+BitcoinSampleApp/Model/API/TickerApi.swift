//
//  TickerApi.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/08.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import Alamofire
import Combine

//sourcery: AutoMockable
protocol TickerApiProtocol {
    func excute(currencyPair: CurrencyPair) -> Future<TickerEntity, ApiError>
}

struct TickerApi: TickerApiProtocol {
    func excute(currencyPair: CurrencyPair) -> Future<TickerEntity, ApiError> {
        let request = TickerApiRequest(currencyPair: currencyPair)
        return HttpsConnectPublisher.publish(request)
    }
}

struct TickerApiRequest: BitbankApiRequest {
    var apiType: ApiType = .typePublic
    typealias Response = TickerEntity
    var method: HTTPMethod { return .get }
    var path: String { return "/\(currencyPair.rawValue)/ticker" }
    private var currencyPair: CurrencyPair

    init(currencyPair: CurrencyPair) {
        self.currencyPair = currencyPair
    }
}
