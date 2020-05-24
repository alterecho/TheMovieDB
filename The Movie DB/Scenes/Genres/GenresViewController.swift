//
//  ViewController.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit

class GenresViewController: BaseViewController {
    
    private var vm: GenresViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let genreCellID: String = "genreCellID"
    
    var output: GenresInteractor?
    
    private let tableView = UITableView()
    var router: GenresRouter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Genres"
        
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)

        
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: genreCellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.fill(view: view)
        
        output?.load()
    }
}


extension GenresViewController: GenresViewProtocol {    
    func display(viewModel: GenresViewModel) {
        self.vm = viewModel
    }
}

extension GenresViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm?.genres.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: genreCellID) ?? UITableViewCell()
        cell.textLabel?.text = vm?.genres[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let genre = vm?.genres[indexPath.row] {
            router?.gotoDiscover(genreName: genre.name, genreID: genre.id)
        }
    }
    
}
