//
//  MovieDetailsConfigurator.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class MovieDetailsConfigurator {
    static func configure(viewController: MovieDetailsViewController, movieID: Int) {
        let presenter = MovieDetailsPresenter(output: viewController)
        let interactor = MovieDetailsInteractor(output: presenter, movieID: movieID)
        let router = MovieDetailsRouter(viewController: viewController)
        viewController.output = interactor
        viewController.router = router
    }
}
