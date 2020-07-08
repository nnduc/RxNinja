//
//  MainViewController.swift
//  RxNinja
//
//  Created by Duc Nguyen on 7/9/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = ListViewController.make(with: ListViewModel(language: "RxSwift"))
        navigationController?.pushViewController(vc, animated: true)
    }
    

}
