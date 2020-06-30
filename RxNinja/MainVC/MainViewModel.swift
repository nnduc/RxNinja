//
//  MainViewModel.swift
//  RxNinja
//
//  Created by Duc Nguyen on 6/30/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MainViewModel: ViewModelType {

    struct Input {
        let name: Observable<String>
        let validate: Observable<Void>
    }

    struct Output {
        let greeting: Driver<String>
    }

    func transform(input: Input) -> Output {
        let greeting = input.validate
            .withLatestFrom(input.name)
            .map { "Hello \($0) \($0.isEmpty ? "😏" : "😂")" }
            .startWith("")
            .asDriver(onErrorJustReturn: ": 🤬")
        return Output(greeting: greeting)
    }

}
