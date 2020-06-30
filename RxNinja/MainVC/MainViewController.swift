//
//  MainViewController.swift
//  RxNinja
//
//  Created by Duc Nguyen on 6/30/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController {

    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var confirmButton: UIButton!
    @IBOutlet private weak var outputLabel: UILabel!

    private let viewModel: MainViewModel = .init()
    private let disposeBag: DisposeBag = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inputTextField.becomeFirstResponder()
    }

    @IBAction private func comfirm(_ sender: Any) {

    }

    private func bindViewModel() {
        let input = MainViewModel.Input(
            name: inputTextField.rx.text.orEmpty.asObservable(),
            validate: confirmButton.rx.tap.asObservable())

        viewModel.transform(input: input)
            .greeting
            .drive(outputLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

