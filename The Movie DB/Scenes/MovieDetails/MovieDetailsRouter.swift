//
//  GenresRouter.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class MovieDetailsRouter: MovieDetailsRouterProtocol {
    
    private weak var viewController: MovieDetailsViewController?
    
    init(viewController: MovieDetailsViewController) {
        self.viewController = viewController
    }
    
    func gotoUserReviews(movieID: Int) {
        let viewController = UserReviewsViewController()
        UserReviewsConfigurator.configure(viewController: viewController, movieID: movieID)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
