//
//  DiscoverRouterTests.swift
//  TheMovieDBTests
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import The_Movie_DB

class GenresRouterTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    func testRouteToDiscoverCalled() {
        let viewController = GenresViewController()
        let router = MockGenresRouter(viewController: viewController)
        viewController.router = router
        
        viewController.display(viewModel: GenresViewModel(genres: [Genre(id: 1, name: "")]))
        
        router.gotoDiscoverExpectation = expectation(description: "testRouteToDiscoverCalled")
        let tableView = UITableView()
        viewController.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        waitForExpectations(timeout: 2.0)
    }
}
