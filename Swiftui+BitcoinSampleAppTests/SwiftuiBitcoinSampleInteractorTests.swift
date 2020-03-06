//
//  SwiftuiBitcoinSampleInteractorTests.swift
//  Swiftui+BitcoinSampleAppTests
//
//  Created by ShinUnuma on 2019/08/14.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import XCTest
import RxSwift
import SwiftyMocky
import RxTest
import RxBlocking
@testable import Swiftui_BitcoinSampleApp

class SwiftuiBitcoinSampleInteractorTests: XCTestCase {
    let testData = TestData()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testTickerInteractor() {
        let mock = TickerUsecaseMock()
        Given(mock, .fetchGetTicker(currencyPair: .value(.btcJpy), willReturn: getTickerTestData()))
        do {
            if let vm = try mock.fetchGetTicker(currencyPair: .btcJpy).toBlocking().first() {
                XCTAssertEqual(vm.sell.rawValue, "1197690")
                XCTAssertEqual(vm.buy.rawValue, "1197689")
                XCTAssertEqual(vm.high.rawValue, "1207360")
                XCTAssertEqual(vm.low.rawValue, "1182642")
                XCTAssertEqual(vm.last.rawValue, "1197689")
                XCTAssertEqual(vm.vol, "830.5370")
                let date = Date(timeIntervalSince1970: 1565680643816)
                XCTAssertEqual(vm.date, date)
            } else {
                Failure("mock fetchGetTicker error. ticker viewmodel is nil")
            }
        } catch {
            Failure("catch error: \(error.localizedDescription)")
        }
    }

    private func getTickerTestData() -> Observable<TickerViewModel> {
        return Observable.create { observer -> Disposable in
            guard let entity = self.testData.tickerEntity else {
                Failure("plist load error. entity is empty")
            }
            let viewModel = TickerViewModel(entity)
            observer.onNext(viewModel)
            return Disposables.create()
        }
    }
}
