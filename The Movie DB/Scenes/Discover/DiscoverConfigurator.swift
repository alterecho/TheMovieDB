//
//  DiscoverConfigurator.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class DiscoverConfigurator {
    static func configure(viewController: DiscoverViewController, genreName: String, genreID: Int) {
        let presenter = DiscoverPresenter(output: viewController)
        let interactor = DiscoverInteractor(output: presenter, genreID: genreID)
        let router = DiscoverRouter(viewController: viewController)
        viewController.title = genreName
        viewController.output = interactor
        viewController.router = router
    }
}
