//
//  MovieDetailsInteractorTests.swift
//  TheMovieDBTests
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import The_Movie_DB
import RxSwift

class MovieDetailsViewTests: XCTestCase {
    
    var sut: MovieDetailsViewController?
    var displayCalledExpectation: XCTestExpectation?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let presenter = MovieDetailsPresenter(output: self)
        let apiWorker = MockMovieDetailsAPIWorker()
        let interactor = MovieDetailsInteractor(output: presenter, movieID: 1, apiWorker: apiWorker)
        let vc = MovieDetailsViewController()
        vc.output = interactor
        sut = vc
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVMUpdateCalledOnUpdate() {
        displayCalledExpectation = expectation(description: "displayCalledExpectation")
        _ = sut?.view
        waitForExpectations(timeout: 2.0)
    }

}

extension MovieDetailsViewTests: MovieDetailsViewProtocol {
    func display(viewModel: MovieDetailsViewModel) {
        displayCalledExpectation?.fulfill()
    }
    
    var isLoading: Bool {
        get {
            return false
        }
        
        set {
            
        }
    }
        
    func displayAlert(title: String, message: String, buttonTitle: String) {
        
    }
}
