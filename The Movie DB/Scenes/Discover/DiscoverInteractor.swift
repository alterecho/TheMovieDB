//
//  DiscoverInteractor.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import RxSwift

class DiscoverInteractor: DiscoverInteractorProtocol {
    
    let apiWorker: DiscoverAPIWorkerProtocol
    let disposeBag = DisposeBag()
    
    private let output: DiscoverPresenterProtocol
    private let genreID: Int
    
    private var currentPage = 0
    private var totalPages = 0
    private var movies: [Movie] = []
    
    init(output: DiscoverPresenterProtocol, genreID: Int, apiWorker: DiscoverAPIWorkerProtocol = DiscoverAPIWorker()) {
        self.output = output
        self.apiWorker = apiWorker
        self.genreID = genreID
    }
    
    func load() {
        resetPages()
        fetchNextPage()
    }
    
    func scrolledToEnd() {
        fetchNextPage()
    }
    
    private func resetPages() {
        currentPage = 0
        totalPages = 1
    }
    
    private func fetchNextPage() {
        if currentPage >= totalPages {
            return
        }
        output.isLoading = true
        apiWorker.fetchMovies(genreId: genreID, page: currentPage + 1).subscribe(onNext: { [weak self] response in
            self?.currentPage = response.page
            self?.totalPages = response.total_pages
            self?.movies.append(contentsOf: response.results)
            self?.output.isLoading = false
            self?.output.show(movies: self?.movies ?? [])
        }, onError: { [weak self] error in
            self?.output.isLoading = true
            self?.output.showAlert(title: "Error", message: error.localizedDescription, buttonTitle: "Ok")
        }).disposed(by: disposeBag)
    }
    
    
}
