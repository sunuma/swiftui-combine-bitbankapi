//
//  ContentView.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/06.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import SwiftUI
import RxSwift

struct ContentView: View {
    @ObservedObject var viewModel: TickerListViewModel
    let disposeBag = DisposeBag()

    init(_ viewModel: TickerListViewModel = TickerListViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List {
                if viewModel.models.isEmpty {
                    emptySection
                } else {
                    forecastSection
                }
            }
            .navigationBarTitle("Bitcoin")
        }
        .onAppear(perform: viewModel.onAppear)
        .alert(isPresented: $viewModel.isShowAlert, content: {
            let message = viewModel.apiError != nil ? Text("\(viewModel.apiError!.errorDescription())") : nil
            let button = Alert.Button.default(Text("再読み込み"), action: {
                self.viewModel.getTickers()
            })
            return Alert(title: Text("通信エラー"), message: message, dismissButton: button)
        })
    }
}

private extension ContentView {
    var forecastSection: some View {
        Section {
            ForEach(viewModel.models, content: TickerRow.init(ticker:))
        }
    }

    var emptySection: some View {
        Section {
            Text("No results").foregroundColor(.gray)
        }
    }
}

#if DEBUG
struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
