//
//  ViewSubscriber.swift
//  Swiftui+BitcoinSampleApp
//
//  Created by ShinUnuma on 2019/08/17.
//  Copyright © 2019 ShinUnuma. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewSubscriber {
    var disposeBag: DisposeBag { get }
}

extension ViewSubscriber {
    func subscribe<T: ObservableType>(_ observer: T,
                                      onNext: ((T.Element) -> Void)? = nil,
                                      onError: ((Error) -> Void)? = nil) {
        observer.observeOn(MainScheduler.instance)
            .subscribe(onNext: { value in
                onNext?(value)
            }, onError: { error in
                onError?(error)
            }).disposed(by: disposeBag)
    }

}
