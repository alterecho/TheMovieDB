//
//  UserReviewsConfigurator.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class UserReviewsConfigurator {
    static func configure(viewController: UserReviewsViewController, movieID: Int) {
        let presenter = UserReviewsPresenter(output: viewController)
        let interactor = UserReviewsInteractor(output: presenter, movieID: movieID)
        viewController.output = interactor
    }
}
