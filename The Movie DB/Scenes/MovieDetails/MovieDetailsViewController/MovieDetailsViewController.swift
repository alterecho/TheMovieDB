//
//  MovieDetailsViewController.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit
import Kingfisher
import youtube_ios_player_helper

class MovieDetailsViewController: BaseViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionView: UITextView!
    @IBOutlet weak var playerView: YTPlayerView!
    
    private var vm: MovieDetailsViewModel? {
        didSet {
            title = vm?.details.title
            descriptionView.text = vm?.details.overview
            let imageURL = Services.imageURL(path: vm?.details.poster_path ?? "").completeURL
            imageView.kf.setImage(with: imageURL)
            if let _ = imageURL {
                imageView.isHidden = false
            } else {
                imageView.isHidden = true
            }
            if let id = vm?.trailerVideoID {
                playerView.isHidden = false
                playerView.load(withVideoId: id)
            } else {
                playerView.isHidden = true
            }
        }
    }
    
    var output: MovieDetailsInteractor?
    var router: MovieDetailsRouterProtocol?
        
    init() {
        super.init(nibName: "MovieDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = UIColor.white
                
        output?.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func userReviewsAction(_ sender: Any) {
        if let movieID = output?.movieID {
            router?.gotoUserReviews(movieID: movieID)
        }
    }
}


extension MovieDetailsViewController: MovieDetailsViewProtocol {    
    func display(viewModel: MovieDetailsViewModel) {
        self.vm = viewModel
//        M7lc1UVf-VE
    }
}

