//
//  GenresPresenter.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

class GenresPresenter: GenresPresenterProtocol {
    
    
    private weak var output: GenresViewProtocol?
    
    var isLoading: Bool = false {
        didSet {
            output?.isLoading = isLoading
        }
    }

    
    init(output: GenresViewProtocol) {
        self.output = output
    }
    
    func show(genres: [Genre]) {
        let viewModel = GenresViewModel(genres: genres)
        output?.display(viewModel: viewModel)
    }
    
    func showAlert(title: String, message: String, buttonTitle: String) {
        output?.displayAlert(title: title, message: message, buttonTitle: buttonTitle)
    }
    
}
