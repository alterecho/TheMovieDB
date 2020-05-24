//
//  BaseViewController.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let background = UIView()
    
    var isLoading: Bool = false {
        didSet {
            if isLoading {
                view.addSubview(background)
                background.fill(view: view)
                background.addSubview(activityIndicator)
                activityIndicator.startAnimating()
                activityIndicator.center(view: background)
            } else {
                background.removeFromSuperview()
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.color = UIColor.blue
        background.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    }    
}

extension BaseViewController: ViewProtocol {
    
    func displayAlert(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
            }
        )
        present(alert, animated: true)
    }
    
}
