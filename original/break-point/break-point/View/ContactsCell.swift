//
//  ContactsCell.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/24/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var checkMarkImg: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Functions
    func setupView() {
        checkMarkImg.isHidden = true
        userProfileImg.image = #imageLiteral(resourceName: "defaultProfileImage")
    }
    
    func configureCheckMark() {
        if checkMarkImg.isHidden == true {
            checkMarkImg.isHidden = false
        } else {
            checkMarkImg.isHidden = true
        }
    }
    
    func configureCell(email: String) {
        userEmailLbl.text = email
    }
}
