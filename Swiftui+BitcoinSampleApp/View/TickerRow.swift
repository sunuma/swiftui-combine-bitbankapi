//
//  TickerRow.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2020/03/06.
//  Copyright © 2020 ShinUnuma. All rights reserved.
//

import SwiftUI

struct TickerRow: View {
    private let ticker: Ticker

    init(ticker: Ticker) {
        self.ticker = ticker
    }

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Image(self.ticker.pair.displayImage())
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text(self.ticker.pair.displayName())
                        .foregroundColor(.gray)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
            HStack {
                VStack {
                    HStack {
                        Text("sell")
                            .foregroundColor(.gray)
                            .frame(width: 40, alignment: .leading)
                        Text("\(self.ticker.sell.rawValue)")
                            .foregroundColor(.orange)
                    }
                    HStack {
                        Text("buy")
                            .foregroundColor(.gray)
                            .frame(width: 40, alignment: .leading)
                        Text("\(self.ticker.buy.rawValue)")
                            .foregroundColor(.orange)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack {
                    HStack {
                        Text("high")
                            .foregroundColor(.gray)
                            .frame(width: 40, alignment: .leading)
                        Text("\(self.ticker.high.rawValue)")
                            .foregroundColor(.orange)
                    }
                    HStack {
                        Text("low")
                            .foregroundColor(.gray)
                            .frame(width: 40, alignment: .leading)
                        Text("\(self.ticker.low.rawValue)")
                            .foregroundColor(.orange)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

//struct TickerRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TickerRow()
//    }
//}
