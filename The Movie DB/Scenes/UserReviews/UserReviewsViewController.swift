//
//  UserReviewsViewController.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit

class UserReviewsViewController: BaseViewController {

    var output: UserReviewsInteractor?
    var router: UserReviewsRouterProtocol?
    
    private let tableView = UITableView()
    
    private let cellID: String = "cellID"
    
    private var vm: UserReviewsViewModel? {
        didSet {
            tableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User Reviews"
        
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        
        tableView.register(UINib(nibName: "UserReviewTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.fill(view: view)

        output?.load()
    }

}

extension UserReviewsViewController: UserReviewsViewProtocol {
    func display(viewModel: UserReviewsViewModel) {
        self.vm = viewModel
    }    
}

extension UserReviewsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.reviews.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? UserReviewTableViewCell else {
            return UITableViewCell()
        }
        cell.review = vm?.reviews[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        }
        
        if indexPath.row == (vm?.reviews.count ?? 0) - 1 {
            output?.scrolledToEnd()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

