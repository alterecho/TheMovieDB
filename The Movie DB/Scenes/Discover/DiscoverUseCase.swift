//
//  DiscoverPage.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import RxSwift

protocol DiscoverViewProtocol: ViewProtocol {
    func display(viewModel: DiscoverViewModel)
}

protocol DiscoverInteractorProtocol {
    func load()
    func scrolledToEnd()
}

protocol DiscoverPresenterProtocol: PresenterProtocol {
    func show(movies: [Movie])
}

protocol DiscoverAPIWorkerProtocol {
    func fetchMovies(genreId: Int, page: Int) -> Observable<DiscoverResponse>
}

protocol DiscoverRouterProtocol {
    func gotoMovieDetails(movieID: Int)
}


