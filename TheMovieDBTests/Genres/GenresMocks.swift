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

class MockGenresAPIWorker: GenresAPIWorkerProtocol {
    var genres: [Genre] = []
    func fetchGenres() -> Observable<GenreResponse> {
        return Observable.just(GenreResponse(genres: genres))
    }
}

class MockGenresRouter: GenresRouter {
    var gotoDiscoverExpectation: XCTestExpectation?
    override func gotoDiscover(genreName: String, genreID: Int) {
        gotoDiscoverExpectation?.fulfill()
        super.gotoDiscover(genreName: genreName, genreID: genreID)
    }
}

