//
//  GenresInteractorTests.swift
//  TheMovieDBTests
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import XCTest
@testable import The_Movie_DB
import RxSwift

class MovieDetailsInteractorTests: XCTestCase {
    
    var sut: GenresInteractor?
    var displayCalledExpectation: XCTestExpectation?
//    var presenter: GenresPresenter?
//    var apiWorker: MockGenresAPIWorker?


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let presenter = GenresPresenter(output: self)
        let apiWorker = MockGenresAPIWorker()
        sut = GenresInteractor(output: presenter, apiWorker: apiWorker)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVMUpdateCalledOnUpdate() {
        displayCalledExpectation = expectation(description: "displayCalledExpectation")
        sut?.load()
        waitForExpectations(timeout: 2.0)
    }

}

extension GenresInteractorTests: GenresViewProtocol {
    var isLoading: Bool {
        get {
            return false
        }
        
        set {
            
        }
    }
    
    func display(viewModel: GenresViewModel) {
        displayCalledExpectation?.fulfill()
    }
    
    func displayAlert(title: String, message: String, buttonTitle: String) {
        
    }
}
