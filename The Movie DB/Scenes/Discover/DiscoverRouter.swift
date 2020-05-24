//
//  GenresRouter.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class DiscoverRouter: DiscoverRouterProtocol {
    
    private weak var viewController: DiscoverViewController?
    
    init(viewController: DiscoverViewController) {
        self.viewController = viewController
    }
    
    func gotoMovieDetails(movieID: Int) {
        let viewController = MovieDetailsViewController()
        MovieDetailsConfigurator.configure(viewController: viewController, movieID: movieID)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
