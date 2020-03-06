//
//  TickerEntity.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/12.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation

// ティッカー情報
struct TickerEntity: Decodable {
    private var success: Int
    private(set) var data: TickerData
    var isSuccess: Bool { success == 1 }

    init(success: Int, data: TickerData) {
        self.success = success
        self.data = data
    }

    private enum CodingKeys: String, CodingKey {
        case success
        case data
    }

    struct TickerData: Decodable {
        var sell: String    // 現在の売り注文の最安値
        var buy: String     // 現在の買い注文の最高値
        var high: String    // 過去24時間の最高値取引価格
        var low: String     // 過去24時間の最安値取引価格
        var last: String    // 最新取引価格
        var vol: String     // 過去24時間の出来高
        var timestamp: UInt
    }
}
