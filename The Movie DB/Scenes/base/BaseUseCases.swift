//
//  BaseUseCases.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import Foundation

protocol ViewProtocol: class {
    var isLoading: Bool { get set }
    func displayAlert(title: String, message: String, buttonTitle: String)
}

protocol PresenterProtocol: class {
    var isLoading: Bool { get set }
    func showAlert(title: String, message: String, buttonTitle: String)
}
