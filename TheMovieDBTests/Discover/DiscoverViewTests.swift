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

class DiscoverViewTests: XCTestCase {
    
    var sut: DiscoverViewController?
    var displayCalledExpectation: XCTestExpectation?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let presenter = DiscoverPresenter(output: self)
        let apiWorker = MockDiscoveryAPIWorker()
        let interactor = DiscoverInteractor(output: presenter, genreID: 1, apiWorker: apiWorker)
        let vc = DiscoverViewController()
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

extension DiscoverViewTests: DiscoverViewProtocol {
    func display(viewModel: DiscoverViewModel) {
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
