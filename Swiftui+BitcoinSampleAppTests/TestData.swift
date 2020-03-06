//
//  TestData.swift
//  Swiftui+BitcoinSampleAppTests
//
//  Created by ShinUnuma on 2019/08/13.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
@testable import Swiftui_BitcoinSampleApp

class TestData {
    private var plist: [String: Any]?

    init() {
        let bundle: Bundle = Bundle(for: type(of: self))
        if let urls = bundle.url(forResource: "TestData", withExtension: "plist") {
            self.plist = NSDictionary(contentsOf: urls) as? [String: Any]
        }
    }

    var tickerEntity: TickerEntity? {
        if let root = plist?["TickerEntity"] as? [String: Any] {
            return TickerEntity(root: root)
        }
        return nil
    }
}

extension TickerEntity {
    init(root: [String: Any]) {
        let data = TickerData(sell: root["sell"] as? String ?? "",
                              buy: root["buy"] as? String ?? "",
                              high: root["high"] as? String ?? "",
                              low: root["low"] as? String ?? "",
                              last: root["last"] as? String ?? "",
                              vol: root["vol"] as? String ?? "",
                              timestamp: root["timestamp"] as? UInt ?? 0)
        self.init(success: 1, data: data)
    }
}
