//
//  MovieDetailsPresenter.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    
    private weak var output: MovieDetailsViewProtocol?
    
    var isLoading: Bool = false {
        didSet {
            output?.isLoading = isLoading
        }
    }
    
    init(output: MovieDetailsViewProtocol) {
        self.output = output
    }
    
    func show(movieDetails: MovieDetails, trailer: Video?) {
        let viewModel = MovieDetailsViewModel(details: movieDetails, trailerVideoID: trailer?.key)
        output?.display(viewModel: viewModel)
    }
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        output?.displayAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
}
