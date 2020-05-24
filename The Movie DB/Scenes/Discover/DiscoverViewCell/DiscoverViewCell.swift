//
//  MoviesViewCell.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 23/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit
import Kingfisher

class DiscoverViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    var movie: Movie? {
        didSet {
            titleLabel.text = movie?.title
            imageView.kf.setImage(with: Services.imageURL(path: movie?.poster_path ?? "").completeURL)
        }
    }
}
