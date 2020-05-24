//
//  DiscoverRouterTests.swift
//  TheMovieDBTests
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import The_Movie_DB

class DiscoverRouterTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    func testRouteToDiscoverCalled() {
        let viewController = DiscoverViewController()
        let router = MockDiscoverRouter(viewController: viewController)
        viewController.router = router
        
        _ = viewController.view
        
        let movie = Movie(popularity: 1.0, video: true, poster_path: "", id: 0, backdrop_path: "", genre_ids: [], title: "", overview: "", release_date: "")
        viewController.display(viewModel: DiscoverViewModel(movies: [movie]))
        
        router.gotoMovieDetailsExpectation = expectation(description: "testRouteToDiscoverCalled")
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        viewController.collectionView(collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
        waitForExpectations(timeout: 2.0)
        
    }
}
