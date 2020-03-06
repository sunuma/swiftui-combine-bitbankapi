// Generated using Sourcery 0.16.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 3.3.4

import SwiftyMocky
#if !MockyCustom
import XCTest
#endif
import RxSwift
@testable import Swiftui_BitcoinSampleApp


// MARK: - DepthApiProtocol
open class DepthApiProtocolMock: DepthApiProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func excute(currencyPair: CurrencyPair) -> Observable<DepthEntity> {
        addInvocation(.m_excute__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`)))
		let perform = methodPerformValue(.m_excute__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`))) as? (CurrencyPair) -> Void
		perform?(`currencyPair`)
		var __value: Observable<DepthEntity>
		do {
		    __value = try methodReturnValue(.m_excute__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for excute(currencyPair: CurrencyPair). Use given")
			Failure("Stub return value not specified for excute(currencyPair: CurrencyPair). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_excute__currencyPair_currencyPair(Parameter<CurrencyPair>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_excute__currencyPair_currencyPair(let lhsCurrencypair), .m_excute__currencyPair_currencyPair(let rhsCurrencypair)):
                guard Parameter.compare(lhs: lhsCurrencypair, rhs: rhsCurrencypair, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_excute__currencyPair_currencyPair(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func excute(currencyPair: Parameter<CurrencyPair>, willReturn: Observable<DepthEntity>...) -> MethodStub {
            return Given(method: .m_excute__currencyPair_currencyPair(`currencyPair`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func excute(currencyPair: Parameter<CurrencyPair>, willProduce: (Stubber<Observable<DepthEntity>>) -> Void) -> MethodStub {
            let willReturn: [Observable<DepthEntity>] = []
			let given: Given = { return Given(method: .m_excute__currencyPair_currencyPair(`currencyPair`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Observable<DepthEntity>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func excute(currencyPair: Parameter<CurrencyPair>) -> Verify { return Verify(method: .m_excute__currencyPair_currencyPair(`currencyPair`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func excute(currencyPair: Parameter<CurrencyPair>, perform: @escaping (CurrencyPair) -> Void) -> Perform {
            return Perform(method: .m_excute__currencyPair_currencyPair(`currencyPair`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - DepthUsecase
open class DepthUsecaseMock: DepthUsecase, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func fetchGetDepth(currencyPair: CurrencyPair) -> Observable<DepthViewModel> {
        addInvocation(.m_fetchGetDepth__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`)))
		let perform = methodPerformValue(.m_fetchGetDepth__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`))) as? (CurrencyPair) -> Void
		perform?(`currencyPair`)
		var __value: Observable<DepthViewModel>
		do {
		    __value = try methodReturnValue(.m_fetchGetDepth__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for fetchGetDepth(currencyPair: CurrencyPair). Use given")
			Failure("Stub return value not specified for fetchGetDepth(currencyPair: CurrencyPair). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_fetchGetDepth__currencyPair_currencyPair(Parameter<CurrencyPair>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_fetchGetDepth__currencyPair_currencyPair(let lhsCurrencypair), .m_fetchGetDepth__currencyPair_currencyPair(let rhsCurrencypair)):
                guard Parameter.compare(lhs: lhsCurrencypair, rhs: rhsCurrencypair, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_fetchGetDepth__currencyPair_currencyPair(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func fetchGetDepth(currencyPair: Parameter<CurrencyPair>, willReturn: Observable<DepthViewModel>...) -> MethodStub {
            return Given(method: .m_fetchGetDepth__currencyPair_currencyPair(`currencyPair`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func fetchGetDepth(currencyPair: Parameter<CurrencyPair>, willProduce: (Stubber<Observable<DepthViewModel>>) -> Void) -> MethodStub {
            let willReturn: [Observable<DepthViewModel>] = []
			let given: Given = { return Given(method: .m_fetchGetDepth__currencyPair_currencyPair(`currencyPair`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Observable<DepthViewModel>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func fetchGetDepth(currencyPair: Parameter<CurrencyPair>) -> Verify { return Verify(method: .m_fetchGetDepth__currencyPair_currencyPair(`currencyPair`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func fetchGetDepth(currencyPair: Parameter<CurrencyPair>, perform: @escaping (CurrencyPair) -> Void) -> Perform {
            return Perform(method: .m_fetchGetDepth__currencyPair_currencyPair(`currencyPair`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - TickerApiProtocol
open class TickerApiProtocolMock: TickerApiProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func excute(currencyPair: CurrencyPair) -> Observable<TickerEntity> {
        addInvocation(.m_excute__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`)))
		let perform = methodPerformValue(.m_excute__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`))) as? (CurrencyPair) -> Void
		perform?(`currencyPair`)
		var __value: Observable<TickerEntity>
		do {
		    __value = try methodReturnValue(.m_excute__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for excute(currencyPair: CurrencyPair). Use given")
			Failure("Stub return value not specified for excute(currencyPair: CurrencyPair). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_excute__currencyPair_currencyPair(Parameter<CurrencyPair>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_excute__currencyPair_currencyPair(let lhsCurrencypair), .m_excute__currencyPair_currencyPair(let rhsCurrencypair)):
                guard Parameter.compare(lhs: lhsCurrencypair, rhs: rhsCurrencypair, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_excute__currencyPair_currencyPair(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func excute(currencyPair: Parameter<CurrencyPair>, willReturn: Observable<TickerEntity>...) -> MethodStub {
            return Given(method: .m_excute__currencyPair_currencyPair(`currencyPair`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func excute(currencyPair: Parameter<CurrencyPair>, willProduce: (Stubber<Observable<TickerEntity>>) -> Void) -> MethodStub {
            let willReturn: [Observable<TickerEntity>] = []
			let given: Given = { return Given(method: .m_excute__currencyPair_currencyPair(`currencyPair`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Observable<TickerEntity>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func excute(currencyPair: Parameter<CurrencyPair>) -> Verify { return Verify(method: .m_excute__currencyPair_currencyPair(`currencyPair`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func excute(currencyPair: Parameter<CurrencyPair>, perform: @escaping (CurrencyPair) -> Void) -> Perform {
            return Perform(method: .m_excute__currencyPair_currencyPair(`currencyPair`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - TickerUsecase
open class TickerUsecaseMock: TickerUsecase, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func fetchGetTicker(currencyPair: CurrencyPair) -> Observable<TickerViewModel> {
        addInvocation(.m_fetchGetTicker__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`)))
		let perform = methodPerformValue(.m_fetchGetTicker__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`))) as? (CurrencyPair) -> Void
		perform?(`currencyPair`)
		var __value: Observable<TickerViewModel>
		do {
		    __value = try methodReturnValue(.m_fetchGetTicker__currencyPair_currencyPair(Parameter<CurrencyPair>.value(`currencyPair`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for fetchGetTicker(currencyPair: CurrencyPair). Use given")
			Failure("Stub return value not specified for fetchGetTicker(currencyPair: CurrencyPair). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_fetchGetTicker__currencyPair_currencyPair(Parameter<CurrencyPair>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_fetchGetTicker__currencyPair_currencyPair(let lhsCurrencypair), .m_fetchGetTicker__currencyPair_currencyPair(let rhsCurrencypair)):
                guard Parameter.compare(lhs: lhsCurrencypair, rhs: rhsCurrencypair, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_fetchGetTicker__currencyPair_currencyPair(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func fetchGetTicker(currencyPair: Parameter<CurrencyPair>, willReturn: Observable<TickerViewModel>...) -> MethodStub {
            return Given(method: .m_fetchGetTicker__currencyPair_currencyPair(`currencyPair`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func fetchGetTicker(currencyPair: Parameter<CurrencyPair>, willProduce: (Stubber<Observable<TickerViewModel>>) -> Void) -> MethodStub {
            let willReturn: [Observable<TickerViewModel>] = []
			let given: Given = { return Given(method: .m_fetchGetTicker__currencyPair_currencyPair(`currencyPair`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Observable<TickerViewModel>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func fetchGetTicker(currencyPair: Parameter<CurrencyPair>) -> Verify { return Verify(method: .m_fetchGetTicker__currencyPair_currencyPair(`currencyPair`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func fetchGetTicker(currencyPair: Parameter<CurrencyPair>, perform: @escaping (CurrencyPair) -> Void) -> Perform {
            return Perform(method: .m_fetchGetTicker__currencyPair_currencyPair(`currencyPair`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - TransactionsApiProtocol
open class TransactionsApiProtocolMock: TransactionsApiProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func excute(currencyPair: CurrencyPair, yyyymmdd: String?) -> Observable<TransactionsEntity> {
        addInvocation(.m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(Parameter<CurrencyPair>.value(`currencyPair`), Parameter<String?>.value(`yyyymmdd`)))
		let perform = methodPerformValue(.m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(Parameter<CurrencyPair>.value(`currencyPair`), Parameter<String?>.value(`yyyymmdd`))) as? (CurrencyPair, String?) -> Void
		perform?(`currencyPair`, `yyyymmdd`)
		var __value: Observable<TransactionsEntity>
		do {
		    __value = try methodReturnValue(.m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(Parameter<CurrencyPair>.value(`currencyPair`), Parameter<String?>.value(`yyyymmdd`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for excute(currencyPair: CurrencyPair, yyyymmdd: String?). Use given")
			Failure("Stub return value not specified for excute(currencyPair: CurrencyPair, yyyymmdd: String?). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(Parameter<CurrencyPair>, Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(let lhsCurrencypair, let lhsYyyymmdd), .m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(let rhsCurrencypair, let rhsYyyymmdd)):
                guard Parameter.compare(lhs: lhsCurrencypair, rhs: rhsCurrencypair, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsYyyymmdd, rhs: rhsYyyymmdd, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func excute(currencyPair: Parameter<CurrencyPair>, yyyymmdd: Parameter<String?>, willReturn: Observable<TransactionsEntity>...) -> MethodStub {
            return Given(method: .m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(`currencyPair`, `yyyymmdd`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func excute(currencyPair: Parameter<CurrencyPair>, yyyymmdd: Parameter<String?>, willProduce: (Stubber<Observable<TransactionsEntity>>) -> Void) -> MethodStub {
            let willReturn: [Observable<TransactionsEntity>] = []
			let given: Given = { return Given(method: .m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(`currencyPair`, `yyyymmdd`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Observable<TransactionsEntity>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func excute(currencyPair: Parameter<CurrencyPair>, yyyymmdd: Parameter<String?>) -> Verify { return Verify(method: .m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(`currencyPair`, `yyyymmdd`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func excute(currencyPair: Parameter<CurrencyPair>, yyyymmdd: Parameter<String?>, perform: @escaping (CurrencyPair, String?) -> Void) -> Perform {
            return Perform(method: .m_excute__currencyPair_currencyPairyyyymmdd_yyyymmdd(`currencyPair`, `yyyymmdd`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

