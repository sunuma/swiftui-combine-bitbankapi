//
//  DepthViewModel.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/14.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class DepthViewModel: ObservableObject {
    @Published var depths: [Depth]
    @Published var apiError: ApiError?
    @Published var isShowAlert = false
    let pair: CurrencyPair
    private let api: DepthApiProtocol
    private var disposables = Set<AnyCancellable>()

    private(set) lazy var onAppear: () -> Void = { [weak self] in
        self?.reload()
    }

    init(api: DepthApiProtocol = DepthApi(), pair: CurrencyPair) {
        self.api = api
        self.pair = pair
        self.depths = []
    }

    func reload() {
        api.excute(currencyPair: pair)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case let .failure(error):
                    self?.apiError = error
                    self?.isShowAlert = true
                case .finished:
                    appPrint("Depth api reqeust finished")
                    self?.isShowAlert = false
                }
                }, receiveValue: { [weak self] value in
                    let data = value.data
                    var depths: [Depth] = []
                    for (index, value) in data.asks.enumerated() {
                        let bid: [String] = data.bids.indices.contains(index) ? data.bids[index] : []
                        depths.append(Depth(ask: value, bid: bid))
                    }
                    self?.depths = depths
            })
            .store(in: &disposables)
    }
}

class Depth: Identifiable {
    private(set) var ask: [String]
    private(set) var bid: [String]

    init(ask: [String], bid: [String]) {
        self.ask = ask
        self.bid = bid
    }
}
