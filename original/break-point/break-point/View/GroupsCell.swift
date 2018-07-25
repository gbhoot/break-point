//
//  GroupsCell.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/24/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class GroupsCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var groupMemberCountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title: String, desc: String, memberCount: Int) {
        groupTitleLbl.text = title
        groupDescLbl.text = desc
        groupMemberCountLbl.text = String(describing: memberCount)
    }

}
