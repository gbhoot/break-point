//
//  FeedCell.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userMessageLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Functions
    func configureCell(email: String, message: String) {
        userProfileImg.image = #imageLiteral(resourceName: "defaultProfileImage")
        self.userEmailLbl.text = email
        self.userMessageLbl.text = message
    }
}
