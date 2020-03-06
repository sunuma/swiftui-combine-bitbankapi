//
//  TransactionsEntity.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/12.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation

struct TransactionsEntity: Decodable {
    private var success: Int
    private(set) var data: TransactionList
    var isSuccess: Bool { success == 1 }

    private enum CodingKeys: String, CodingKey {
        case success
        case data
    }

    struct TransactionList: Decodable {
        var transactions: [TransactionData]
    }

    struct TransactionData: Decodable {
        var transactionId: UInt     // 取引ID
        var side: String            // "buy" または "sell"
        var price: String           // 価格
        var amount: String          // 数量
        var executedAt: UInt        // 約定日時（UnixTimeのミリ秒）

        private enum RootKeys: String, CodingKey {
            case transactionId = "transaction_id"
            case executedAt = "executed_at"
        }
    }
}
