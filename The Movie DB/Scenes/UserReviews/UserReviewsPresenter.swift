//
//  UserReviewsPresenter.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class UserReviewsPresenter: UserReviewsPresenterProtocol {
    
    private weak var output: UserReviewsViewProtocol?
    
    var isLoading: Bool = false {
        didSet {
            output?.isLoading = isLoading
        }
    }

    
    init(output: UserReviewsViewProtocol) {
        self.output = output
    }
    
    func show(userReviews: [UserReview]) {
        let viewModel = UserReviewsViewModel(reviews: userReviews)
        output?.display(viewModel: viewModel)
    }
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        output?.displayAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
}
