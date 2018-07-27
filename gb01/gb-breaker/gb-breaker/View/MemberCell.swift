//
//  MemberCell.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/26/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class MemberCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var whiteCheckImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        whiteCheckImg.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // Functions
    func configureCell(email: String) {
        self.userEmailLbl.text = email
    }

    func configureCheckMark() {
        if whiteCheckImg.isHidden == true {
            whiteCheckImg.isHidden = false
        } else {
            whiteCheckImg.isHidden = true
        }
    }
    

}
