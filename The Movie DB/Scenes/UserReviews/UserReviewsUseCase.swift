//
//  UserReviewsUseCase.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import RxSwift

protocol UserReviewsViewProtocol: ViewProtocol {
    func display(viewModel: UserReviewsViewModel)
}

protocol UserReviewsInteractorProtocol {
    func load()
    func scrolledToEnd()
}

protocol UserReviewsPresenterProtocol: PresenterProtocol {
    func show(userReviews: [UserReview])
}

protocol UserReviewsAPIWorkerProtocol {
    func fetchUserReviews(movieID: Int) -> Observable<UserReviewsResponse>
}

protocol UserReviewsRouterProtocol {

}
