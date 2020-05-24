//
//  GenresConfigurator.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class GenresConfigurator {
    static func configure(viewController: GenresViewController) {
        let presenter = GenresPresenter(output: viewController)
        let interactor = GenresInteractor(output: presenter)
        let router = GenresRouter(viewController: viewController)
        viewController.output = interactor
        viewController.router = router
    }
}
