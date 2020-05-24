//
//  UserReviewTableViewCell.swift
//  The Movie DB
//
//  Created by v.a.jayachandran on 24/5/20.
//  Copyright © 2020 v.a.jayachandran. All rights reserved.
//

import UIKit

class UserReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    var review: UserReview? {
        didSet {
            reviewLabel.text = review?.content
            userLabel.text = review?.author
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
