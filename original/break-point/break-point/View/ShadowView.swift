//
//  ShadowView.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/20/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

@IBDesignable

class ShadowView: UIView {
    
    override func awakeFromNib() {
        setupView()
        
        super.awakeFromNib()
    }

    func setupView() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
