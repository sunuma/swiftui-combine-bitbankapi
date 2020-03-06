//
//  DepthInteractor.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/14.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import Combine

//sourcery: AutoMockable
protocol DepthUsecase {
    //func fetchGetDepth(currencyPair: CurrencyPair) -> Future<DepthViewModel, ApiError>
}

struct DepthInteractor: DepthUsecase {
    private var api: DepthApiProtocol

    init(_ api: DepthApiProtocol = DepthApi()) {
        self.api = api
    }

    //func fetchGetDepth(currencyPair: CurrencyPair) -> Future<DepthViewModel, ApiError> {
    //    return api.excute(currencyPair: currencyPair).map { DepthViewModel($0) }
    //}
}
