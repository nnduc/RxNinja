//
//  DetailViewController.swift
//  RxNinja
//
//  Created by Duc Nguyen on 7/8/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import WebKit
//import RxWebKit

final class DetailViewController: UIViewController {

    static func make(with viewModel: DetailViewModel) -> DetailViewController {
        let view = DetailViewController.instantiate()
        view.viewModel = viewModel
        return view
    }

    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var webView: WKWebView!

    private var viewModel: DetailViewModelType!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.outputs.navigationBarTitle
            .observeOn(MainScheduler.instance)
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)

//        webView.rx.loading
//            .observeOn(MainScheduler.asyncInstance)
//            .bind(to: indicatorView.rx.isAnimating)
//            .disposed(by: disposeBag)

        webView.load(viewModel.outputs.request)
    }
}

extension DetailViewController: StoryboardInstantiable {}
