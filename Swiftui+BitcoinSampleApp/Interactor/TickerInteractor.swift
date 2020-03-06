//
//  TickerInteractor.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/14.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import RxSwift

//protocol TickerUsecase {
//    func fetchGetTicker(currencyPair: CurrencyPair) -> Observable<TickerViewModel>
//}
//
//struct TickerInteractor: TickerUsecase {
//    private var api: TickerApiProtocol
//
//    init(_ api: TickerApiProtocol = TickerApi()) {
//        self.api = api
//    }
//
//    func fetchGetTicker(currencyPair: CurrencyPair) -> Observable<TickerViewModel> {
//        return api.excute(currencyPair: currencyPair).map { TickerViewModel($0, pair: currencyPair) }
//    }
//}
