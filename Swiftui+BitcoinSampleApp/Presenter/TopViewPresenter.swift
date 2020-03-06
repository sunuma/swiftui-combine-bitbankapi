//
//  TopViewPresenter.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/14.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftUI
import Combine

//protocol TopViewPresentation {
//    var tickerList: PublishRelay<TickerList> { get }
//    var error: PublishRelay<Error> { get }
//
//    func initialize()
//}
//
//class TopViewPresenter: TopViewPresentation {
//    private var tickerInteractor: TickerUsecase
//    private var router: TopViewWireframe
//    private var pairList = CurrencyPair.all()
//    private var disponseBag = DisposeBag()
//    private(set) var tickerList = PublishRelay<TickerList>()
//    private(set) var error = PublishRelay<Error>()
//    @State var models: [TickerViewModel] { didSet { willChange.send() } }
//
//    init(router: TopViewWireframe = TopViewRouter(),
//         tickerInteractor: TickerUsecase = TickerInteractor()) {
//        self.router = router
//        self.tickerInteractor = tickerInteractor
//    }
//
//    func initialize() {
//        let observers = pairList.map { self.tickerInteractor.fetchGetTicker(currencyPair: $0) }
//        Observable.zip(observers).subscribe(onNext: { models in
//            appDump(models)
//            let tickerList = TickerList(models: models)
//            self.tickerList.accept(tickerList)
//        }, onError: { error in
//            appDump(error)
//            self.error.accept(error)
//        }).disposed(by: disponseBag)
//    }
//
//    func selectedPair(index: Int) {
//        let pair = pairList[index]
//        router.presentDetail(pair)
//    }
//}
