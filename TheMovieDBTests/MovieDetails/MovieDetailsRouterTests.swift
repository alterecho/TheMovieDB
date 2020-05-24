//
//  DiscoverRouterTests.swift
//  TheMovieDBTests
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import The_Movie_DB

class MovieDetailsRouterTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    func testRouteToDiscoverCalled() {
        let viewController = MovieDetailsViewController()
        let router = MockMovieDetailsRouter(viewController: viewController)
        viewController.router = router
        
        _ = viewController.view
        
        
        router.gotoUserReviewsExpectation = expectation(description: "testRouteToDiscoverCalled")
        viewController.userReviewsAction(self)
        waitForExpectations(timeout: 2.0)
    }
}
