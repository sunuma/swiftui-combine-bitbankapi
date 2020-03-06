//
//  TransactionsApi.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/08.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import Alamofire
import Combine

//sourcery: AutoMockable
protocol TransactionsApiProtocol {
    func excute(currencyPair: CurrencyPair, yyyymmdd: String?) -> Future<TransactionsEntity, ApiError>
}

struct TransactionApi: TransactionsApiProtocol {
    func excute(currencyPair: CurrencyPair, yyyymmdd: String?) -> Future<TransactionsEntity, ApiError> {
        let request = TransactionsApiRequest(currencyPair: currencyPair, yyyymmdd: yyyymmdd)
        return HttpsConnectPublisher.publish(request)
    }
}

struct TransactionsApiRequest: BitbankApiRequest {
    var apiType: ApiType = .typePublic
    typealias Response = TransactionsEntity
    var method: HTTPMethod { return .get }
    var path: String {
        var prefix: String = ""
        if let yyyymmdd = self.yyyymmdd {
            prefix = "/\(yyyymmdd)"
        }
        return "/\(currencyPair.rawValue)/transactions" + prefix
    }
    private var currencyPair: CurrencyPair
    private var yyyymmdd: String?

    init(currencyPair: CurrencyPair, yyyymmdd: String? = nil) {
        self.currencyPair = currencyPair
        self.yyyymmdd = yyyymmdd
    }
}
