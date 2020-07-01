//
//  ViewController.swift
//  RxNinja
//
//  Created by Duc Nguyen on 6/30/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginVC: UIViewController {

    @IBOutlet private weak var accountTextField: UITextField!
    @IBOutlet private weak var accountErrorLabel: UILabel!

    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var passwordErrorLabel: UILabel!

    @IBOutlet private weak var loginButton: UIButton!

    private var viewModel = LoginVM()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindingData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        accountTextField.becomeFirstResponder()
    }

    private func bindingData() {
        accountTextField.rx.text.orEmpty.bind(to: viewModel.usernameText).disposed(by: disposeBag)
        passwordTextField.rx.text.orEmpty.bind(to: viewModel.passwordText).disposed(by: disposeBag)

        viewModel.isValid.subscribe { [weak self] isValid in
            let valid: Bool = isValid.element ?? false
            self?.loginButton.isEnabled = valid
            self?.loginButton.alpha = valid ? 1 : 0.2
        }.disposed(by: disposeBag)
    }

}
