//
//  MovieDetailsInteractor.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import RxSwift

class MovieDetailsInteractor: MovieDetailsInteractorProtocol {
    
    let apiWorker: MovieDetailsAPIWorkerProtocol
    let disposeBag = DisposeBag()
    
    private let output: MovieDetailsPresenterProtocol
    
    let movieID: Int
    
    init(output: MovieDetailsPresenterProtocol, movieID: Int, apiWorker: MovieDetailsAPIWorkerProtocol = MovieDetailsAPIWorker()) {
        self.output = output
        self.apiWorker = apiWorker
        self.movieID = movieID
    }
    
    func load() {
        output.isLoading = true
        let movieID = self.movieID
        apiWorker.fetchMovieDetails(movieID: movieID).subscribe(onNext: { [weak self] movieDetails in
            self?.output.isLoading = false
            self?.apiWorker.fetchVideos(movieID: movieID).subscribe(onNext: { response in
                let trailer = response.results.filter {
                    $0.type == VideoType.Trailer.rawValue
                }.first
                if let trailer = trailer {
                    self?.output.show(movieDetails: movieDetails, trailer: trailer)
                }
            }, onError: { error in
                self?.output.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
            }).disposed(by: self?.disposeBag ?? DisposeBag())
            self?.output.show(movieDetails: movieDetails, trailer: nil)
        }, onError: { [weak self] error in
            self?.output.isLoading = false
            self?.output.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")    
        }).disposed(by: disposeBag)
    }
    
    
}
