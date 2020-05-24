//
//  GenresInteractor.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import RxSwift

class GenresInteractor: GenresInteractorProtocol {
    
    let apiWorker: GenresAPIWorkerProtocol
    let disposeBag = DisposeBag()
    
    private let output: GenresPresenterProtocol
    
    init(output: GenresPresenterProtocol, apiWorker: GenresAPIWorkerProtocol = GenresAPIWorker()) {
        self.output = output
        self.apiWorker = apiWorker
    }
    
    func load() {
        output.isLoading = true
        apiWorker.fetchGenres().subscribe(onNext: { [weak self] genresResponse in
            self?.output.isLoading = false
            self?.output.show(genres: genresResponse.genres)
        }, onError: { [weak self] error in
            self?.output.isLoading = false
            self?.output.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
            }).disposed(by: disposeBag)
    }    
}
