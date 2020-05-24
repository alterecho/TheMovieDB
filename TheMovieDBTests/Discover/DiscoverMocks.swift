//
//  MockMovieDetailsAPIWorker.swift
//  TheMovieDBTests
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

@testable import The_Movie_DB
import RxSwift
import XCTest

class MockDiscoveryAPIWorker: DiscoverAPIWorkerProtocol {
    func fetchMovies(genreId: Int, page: Int) -> Observable<DiscoverResponse> {
        let response = DiscoverResponse(page: 1, total_results: 10, total_pages: 1, results: [])
        return Observable.just(response)
    }
}

class MockDiscoverRouter: DiscoverRouter {
    var gotoMovieDetailsExpectation: XCTestExpectation?
    override func gotoMovieDetails(movieID: Int) {
        gotoMovieDetailsExpectation?.fulfill()
        super.gotoMovieDetails(movieID: movieID)
    }
}

