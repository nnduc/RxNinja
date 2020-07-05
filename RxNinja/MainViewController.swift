//
//  ViewController.swift
//  RxNinja
//
//  Created by Duc Nguyen on 6/30/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!

    private let disposeBag = DisposeBag()
    private let viewModel = MainViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.rx.text
            .orEmpty
            .debounce(.milliseconds(200), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: { [unowned self] query in
                if query.isEmpty {
                    self.viewModel.filteredCities.accept(self.viewModel.cities)
                } else {
                    self.viewModel.filteredCities.accept(self.viewModel.cities.filter { $0.hasPrefix(query) })
                }
                self.tableView.reloadData()
            }).disposed(by: disposeBag)

        viewModel.filteredCities.observeOn(MainScheduler.instance).bind(to: tableView.rx.items) { table, index, element in
            let cell = UITableViewCell(style: .default, reuseIdentifier:
                "CityCell")
            cell.textLabel?.text = element
            return cell
        }.disposed(by: disposeBag)

        tableView.rx.modelSelected(String.self)
            .subscribe(onNext: { name in
                print(name)
            })
            .disposed(by: disposeBag)
    }
}
