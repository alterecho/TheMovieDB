//
//  GenresUseCase.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation
import RxSwift

protocol GenresViewProtocol: ViewProtocol {
    func display(viewModel: GenresViewModel)
    func displayAlert(title: String, message: String, buttonTitle: String)
}

protocol GenresInteractorProtocol {
    func load()
}

protocol GenresPresenterProtocol: PresenterProtocol {
    func show(genres: [Genre])
}

protocol GenresAPIWorkerProtocol {
    func fetchGenres() -> Observable<GenreResponse>
}

protocol GenresRouterProtocol {
    func gotoDiscover(genreName: String, genreID: Int)
}
