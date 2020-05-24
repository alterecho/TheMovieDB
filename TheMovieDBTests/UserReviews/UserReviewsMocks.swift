//
//  MockMovieDetailsAPIWorker.swift
//  TheMovieDBTests
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

@testable import The_Movie_DB
import RxSwift

class MockUserReviewsAPIWorker: UserReviewsAPIWorkerProtocol {
    func fetchUserReviews(movieID: Int) -> Observable<UserReviewsResponse> {
        let response = UserReviewsResponse(id: 1, page: 1, results: [], total_pages: 1, total_results: 10)
        return Observable.just(response)
    }
}
