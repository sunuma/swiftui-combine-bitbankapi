//
//  CurrencyPair.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/24.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import SwiftUI

enum CurrencyPair: String {
    case btcJpy = "btc_jpy"
    case xrpJpy = "xrp_jpy"
    case ltcBtc = "ltc_btc"
    case ethBtc = "eth_btc"
    case monaJpy = "mona_jpy"
    case monaBtc = "mona_btc"
    case bccJpy = "bcc_jpy"
    case bccBtc = "bcc_btc"

    static func all() -> [CurrencyPair] {
        return [
            .btcJpy,
            .xrpJpy,
            .ltcBtc,
            .ethBtc,
            .monaJpy,
            .monaBtc,
            .bccJpy,
            .bccBtc
        ]
    }

    func displayName() -> String {
        switch self {
        case .btcJpy:   return "BTC/JPY"
        case .xrpJpy:   return "XRP/JPY"
        case .ltcBtc:   return "LTC/BTC"
        case .ethBtc:   return "ETH/BTC"
        case .monaJpy:  return "MONA/JPY"
        case .monaBtc:  return "MONA/BTC"
        case .bccJpy:   return "BCC/JPY"
        case .bccBtc:   return "BCC/BTC"
        }
    }

    func displayImage() -> String {
        switch self {
        case .btcJpy:   return "icon_btc"
        case .xrpJpy:   return "icon_xrp"
        case .ltcBtc:   return "icon_ltc"
        case .ethBtc:   return "icon_eth"
        case .monaJpy:  return "icon_mona"
        case .monaBtc:  return "icon_mona"
        case .bccJpy:   return "icon_bcc"
        case .bccBtc:   return "icon_bcc"
        }
    }
}
