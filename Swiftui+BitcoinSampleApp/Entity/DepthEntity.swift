//
//  DepthEntity.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/12.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation

struct DepthEntity: Decodable {
    private var success: Int
    private(set) var data: DepthData
    var isSuccess: Bool { success == 1 }

    private enum CodingKeys: String, CodingKey {
        case success
        case data
    }

    struct DepthData: Decodable {
        var asks: [[String]]    // 売り板 [価格, 数量]
        var bids: [[String]]    // 買い板 [価格, 数量]
    }
}
