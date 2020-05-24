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

class UserReviewsViewTests: XCTestCase {
    
    var sut: UserReviewsViewController?
    var displayCalledExpectation: XCTestExpectation?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let presenter = UserReviewsPresenter(output: self)
        let apiWorker = MockUserReviewsAPIWorker()
        let interactor = UserReviewsInteractor(output: presenter, movieID: 1, apiWorker: apiWorker)
        let vc = UserReviewsViewController()
        vc.output = interactor
        sut = vc
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVMUpdateCalledOnLoad() {
        displayCalledExpectation = expectation(description: "displayCalledExpectation")
        _ = sut?.view
        waitForExpectations(timeout: 2.0)
    }

}

extension UserReviewsViewTests: UserReviewsViewProtocol {
    func display(viewModel: UserReviewsViewModel) {
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
