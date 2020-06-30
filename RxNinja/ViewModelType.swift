//
//  ViewModelType.swift
//  RxNinja
//
//  Created by Duc Nguyen on 6/30/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import Foundation

protocol ViewModelType {

    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
