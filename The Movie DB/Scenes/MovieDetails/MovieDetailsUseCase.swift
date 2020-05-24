//
//  MovieDetailsUseCase.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import RxSwift

protocol MovieDetailsViewProtocol: ViewProtocol {
    func display(viewModel: MovieDetailsViewModel)
}

protocol MovieDetailsInteractorProtocol {
    var movieID: Int { get }
    func load()
}

protocol MovieDetailsPresenterProtocol: PresenterProtocol {
    func show(movieDetails: MovieDetails, trailer: Video?)
}

protocol MovieDetailsAPIWorkerProtocol {
    func fetchMovieDetails(movieID: Int) -> Observable<MovieDetails>
    func fetchVideos(movieID: Int) -> Observable<VideosResponse>
}

protocol MovieDetailsRouterProtocol {
    func gotoUserReviews(movieID: Int)
}


