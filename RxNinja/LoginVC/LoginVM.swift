//
//  LoginVM.swift
//  RxNinja
//
//  Created by Duc Nguyen on 7/1/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class LoginVM {
    var usernameText = BehaviorRelay<String>(value: "")
    var passwordText = BehaviorRelay<String>(value: "")

    var isValidUsername: Observable<Bool> {
        return usernameText.asObservable().map { $0.count > 6 }
    }

    var isValidPassword: Observable<Bool> {
        return passwordText.asObservable().map { $0.count > 6 }
    }

    var isValid: Observable<Bool> {
        return Observable.combineLatest(isValidPassword, isValidUsername) { $0 && $1 }
    }
}
