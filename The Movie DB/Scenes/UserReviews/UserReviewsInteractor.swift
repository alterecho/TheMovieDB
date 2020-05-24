//
//  UserReviewsInteractor.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import RxSwift

class UserReviewsInteractor: UserReviewsInteractorProtocol {
    
    let apiWorker: UserReviewsAPIWorkerProtocol
    let disposeBag = DisposeBag()
    
    private let output: UserReviewsPresenterProtocol
    
    private let movieID: Int
    
    private var currentPage = 0
    private var totalPages = 0
    private var reviews: [UserReview] = []
    
    private func resetPages() {
        currentPage = 0
        totalPages = 1
    }
    

    
    init(output: UserReviewsPresenterProtocol, movieID: Int, apiWorker: UserReviewsAPIWorkerProtocol = UserReviewsAPIWorker()) {
        self.output = output
        self.apiWorker = apiWorker
        self.movieID = movieID
    }
    
    func load() {
        resetPages()
        fetchNextPage()
    }
    
    private func fetchNextPage() {
        if currentPage >= totalPages {
            return
        }
        
        output.isLoading = true
        apiWorker.fetchUserReviews(movieID: movieID).subscribe(onNext: { [weak self] response in
            self?.output.isLoading = false
            self?.currentPage = response.page
            self?.totalPages = response.total_pages
            self?.reviews.append(contentsOf: response.results)
            self?.output.show(userReviews: self?.reviews ?? [])
        }, onError: { [weak self] error in
            self?.output.isLoading = false
            self?.output.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
        }).disposed(by: disposeBag)

    }
    
    func scrolledToEnd() {
        fetchNextPage()
    }
    
    

    
}
