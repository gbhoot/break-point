//
//  FeedCell.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/23/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import Firebase

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
    
    func configureCell(uid: String, message: String) {
        userMessageLbl.text = message
        userEmailLbl.text = uid
        userProfileImg.image = #imageLiteral(resourceName: "defaultProfileImage")
    }

}
