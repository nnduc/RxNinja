//
//  MainViewModel.swift
//  RxNinja
//
//  Created by Duc Nguyen on 7/6/20.
//  Copyright © 2020 Duc Nguyen. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {

    var filteredCities = BehaviorRelay<[String]>(value: [])
    let cities = ["Oklahoma", "Chicago", "Moscow", "Danang", "Vancouver", "Praga"]

    init() {
    }

}
