//
//  SwiftuiBitcoinSampleApiTests.swift
//  Swiftui+BitcoinSampleAppTests
//
//  Created by ShinUnuma on 2019/08/13.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import XCTest
import RxSwift
import SwiftyMocky
import RxTest
import RxBlocking
@testable import Swiftui_BitcoinSampleApp

class SwiftuiBitcoinSampleApiTests: XCTestCase {
    let testData = TestData()

    override func setUp() {
    }

    override func tearDown() {
    }

    // Plistのテストデータ検証
    func testTickerApiTestData() {
        let mock = TickerApiProtocolMock()
        Given(mock, .excute(currencyPair: .value(.btcJpy), willReturn: getTickerTestData()))
        do {
            let optEntity = try mock.excute(currencyPair: .btcJpy).toBlocking().first()
            guard let entity = optEntity else {
                Failure("mock excute error. tickerEntity is nil")
            }
            let data = entity.data
            XCTAssertEqual(entity.isSuccess, true)
            XCTAssertEqual(data.sell, "1197690")
            XCTAssertEqual(data.buy, "1197689")
            XCTAssertEqual(data.high, "1207360")
            XCTAssertEqual(data.low, "1182642")
            XCTAssertEqual(data.last, "1197689")
            XCTAssertEqual(data.vol, "830.5370")
            XCTAssertEqual(data.timestamp, 1565680643816)
        } catch {
            Failure("catch error: \(error.localizedDescription)")
        }
    }

    // get /ticker 検証
    func testTickerApiRequest() {
        let mock = TickerApiProtocolMock()
        Given(mock, .excute(currencyPair: .value(.btcJpy), willReturn: executeGetTickerApi()))
        do {
            let optEntity = try mock.excute(currencyPair: .btcJpy).toBlocking().first()
            guard let entity = optEntity else {
                Failure("mock excute error. tickerEntity is nil")
            }
            let data = entity.data
            XCTAssertEqual(entity.isSuccess, true)
            XCTAssert(!data.sell.isEmpty)
            XCTAssert(!data.buy.isEmpty)
            XCTAssert(!data.high.isEmpty)
            XCTAssert(!data.low.isEmpty)
            XCTAssert(!data.last.isEmpty)
            XCTAssert(!data.vol.isEmpty)
            XCTAssert(data.timestamp != 0)
        } catch {
            Failure("catch error: \(error.localizedDescription)")
        }
    }

    // get /depth 検証
    func testDepthApiRequest() {
        let mock = DepthApiProtocolMock()
        Given(mock, .excute(currencyPair: .value(.btcJpy), willReturn: executeGetDepothApi()))
        do {
            let optEntity = try mock.excute(currencyPair: .btcJpy).toBlocking().first()
            guard let entity = optEntity else {
                Failure("mock excute error. tickerEntity is nil")
            }
            let data = entity.data
            XCTAssertEqual(entity.isSuccess, true)
            XCTAssert(data.asks.count > 0)
            XCTAssert(data.asks.first?.count == 2)
            XCTAssert(data.bids.count > 0)
            XCTAssert(data.bids.first?.count == 2)
        } catch {
            Failure("catch error: \(error.localizedDescription)")
        }
    }

    private func getTickerTestData() -> Observable<TickerEntity> {
        return Observable.create { observer -> Disposable in
            guard let entity = self.testData.tickerEntity else {
                Failure("plist load error. entity is empty")
            }
            observer.onNext(entity)
            return Disposables.create()
        }
    }

    private func executeGetTickerApi() -> Observable<TickerEntity> {
        let request = TickerApiRequest(currencyPair: .btcJpy)
        return HttpsClient().request(request)
    }

    private func executeGetDepothApi() -> Observable<DepthEntity> {
        let request = DepthApiRequest(currencyPair: .btcJpy)
        return HttpsClient().request(request)
    }
}
