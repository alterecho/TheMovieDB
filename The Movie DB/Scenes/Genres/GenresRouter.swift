//
//  GenresRouter.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class GenresRouter: GenresRouterProtocol {
    
    private weak var viewController: GenresViewController?
    
    init(viewController: GenresViewController) {
        self.viewController = viewController
    }
    
    func gotoDiscover(genreName: String, genreID: Int) {
        let viewController = DiscoverViewController()
        DiscoverConfigurator.configure(viewController: viewController, genreName: genreName, genreID: genreID)
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
