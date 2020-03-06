//
//  TickerViewModel.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/14.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import Combine

class TickerListViewModel: ObservableObject {
    @Published var models: [Ticker]
    @Published var apiError: ApiError?
    @Published var isShowAlert = false
    private var pairList = CurrencyPair.all()
    let api: TickerApiProtocol
    private var disposables = Set<AnyCancellable>()

    private(set) lazy var onAppear: () -> Void = { [weak self] in
        self?.getTickers()
    }

    init(api: TickerApiProtocol = TickerApi()) {
        self.api = api
        self.models = []
    }

    func getTickers() {
        apiError = nil
        getTicker(index: 0)
    }

    private func getTicker(index: Int) {
        if !pairList.indices.contains(index) {
            return
        }
        let pair = pairList[index]
        api.excute(currencyPair: pair)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case let .failure(error):
                    self?.apiError = error
                    self?.isShowAlert = true
                case .finished:
                    appPrint("Ticker api reqeust finished")
                    self?.isShowAlert = false
                    let next = index + 1
                    self?.getTicker(index: next)
                }
                }, receiveValue: { [weak self] value in
                    self?.models.append(Ticker(value, pair: pair))
            })
            .store(in: &disposables)
    }
}

class Ticker: Identifiable {
    private(set) var sell: Amount
    private(set) var buy: Amount
    private(set) var high: Amount
    private(set) var low: Amount
    private(set) var last: Amount
    private(set) var vol: String
    private(set) var date: Date
    private(set) var pair: CurrencyPair

    init(_ entity: TickerEntity, pair: CurrencyPair) {
        let data = entity.data
        self.sell = Amount(data.sell)
        self.buy = Amount(data.buy)
        self.high = Amount(data.high)
        self.low = Amount(data.low)
        self.last = Amount(data.last)
        self.vol = data.vol
        self.date = Date(timeIntervalSince1970: TimeInterval(data.timestamp))
        self.pair = pair
    }
}
