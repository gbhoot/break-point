//
//  ShadowView.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        customizeView()
        super.awakeFromNib()
    }
    
    func customizeView() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
    }
    
}
