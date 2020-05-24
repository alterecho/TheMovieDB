//
//  DiscoverPresenter.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class DiscoverPresenter: DiscoverPresenterProtocol {
    
    var isLoading: Bool = false {
        didSet {
            output?.isLoading = isLoading
        }
    }

    private weak var output: DiscoverViewProtocol?
    
    init(output: DiscoverViewProtocol) {
        self.output = output
    }
    
    func show(movies: [Movie]) {
        let viewModel = DiscoverViewModel(movies: movies)
        output?.display(viewModel: viewModel)
    }
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        output?.displayAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
}
