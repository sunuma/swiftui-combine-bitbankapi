//
//  DepthRow.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2020/03/07.
//  Copyright © 2020 ShinUnuma. All rights reserved.
//

import SwiftUI

struct DepthRow: View {
    private let depth: Depth

    init(depth: Depth) {
        self.depth = depth
    }

    var body: some View {
        VStack {
            HStack {
                Text("\(self.depth.ask[0]) / \(self.depth.ask[1])")
                    .foregroundColor(.gray)
                    .frame(width: 140, alignment: .leading)
                Text("\(self.depth.ask[0]) / \(self.depth.ask[1])")
                    .foregroundColor(.gray)
                    .frame(width: 140, alignment: .leading)
            }
        }
    }
}

//struct DepthRow_Previews: PreviewProvider {
//    static var previews: some View {
//        DepthRow()
//    }
//}
