//
//  DetailView.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/17.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DepthViewModel

    init(viewModel: DepthViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List {
            section
        }
        .navigationBarTitle("\(viewModel.pair.displayName())")
        .onAppear(perform: viewModel.onAppear)
    }
}

private extension DetailView {
    var section: some View {
        Section(header: Text("ask(price / amount) bid(price / amount)")) {
            ForEach(viewModel.depths) {
                DepthRow(depth: $0)
            }
        }
    }
}

//#if DEBUG
//struct DetailViewPreviews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
//#endif
