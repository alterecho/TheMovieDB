//
//  DiscoverViewController.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {
    
    private var vm: DiscoverViewModel? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let cellID: String = "cellID"
    
    var output: DiscoverInteractorProtocol?
    var router: DiscoverRouterProtocol?
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(UINib(nibName: "DiscoverViewCell", bundle: nil), forCellWithReuseIdentifier: cellID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.fill(view: view)
        
        output?.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spacing: CGFloat = 10.0
            layout.itemSize = CGSize(width: view.frame.width * 0.5 - spacing, height: view.frame.height * 0.5 - spacing)
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
        }

    }
}


extension DiscoverViewController: DiscoverViewProtocol {    
    func display(viewModel: DiscoverViewModel) {
        self.vm = viewModel
    }
}

extension DiscoverViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm?.movies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? DiscoverViewCell else {
            return UICollectionViewCell()
        }
        
        cell.movie = vm?.movies[indexPath.row]
        
        if indexPath.row == (vm?.movies.count ?? 1) - 1 {
            output?.scrolledToEnd()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movie = vm?.movies[indexPath.row] {
            router?.gotoMovieDetails(movieID: movie.id)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }

}
