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

class MockMovieDetailsAPIWorker: MovieDetailsAPIWorkerProtocol {
    func fetchMovieDetails(movieID: Int) -> Observable<MovieDetails> {
        let movieDetails = MovieDetails(overview: "", poster_path: "", release_date: "", title: "", video: false)
        return Observable.just(movieDetails)
    }
    
    func fetchVideos(movieID: Int) -> Observable<VideosResponse> {
        let response = VideosResponse(id: 1, results: [])
        return Observable.just(response)
    }
}

class MockMovieDetailsRouter: MovieDetailsRouter {
    var gotoUserReviewsExpectation: XCTestExpectation?
    override func gotoUserReviews(movieID: Int) {
        gotoUserReviewsExpectation?.fulfill()
        super.gotoUserReviews(movieID: movieID)
    }
}
