//
//  DepthViewModel.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/14.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation

protocol DepthViewModelInterface {
    var asks: [[Amount]] { get }
    var bids: [[Amount]] { get }
}

struct DepthViewModel: DepthViewModelInterface {
    private(set) var asks: [[Amount]]
    private(set) var bids: [[Amount]]

    init(_ entity: DepthEntity) {
        let data = entity.data
        self.asks = data.asks.map { $0.map { Amount($0) } }
        self.bids = data.bids.map { $0.map { Amount($0) } }
    }
}
