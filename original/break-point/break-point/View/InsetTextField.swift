//
//  InsetTextField.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/20/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class InsetTextField: UITextField {
    
    // Variables
    @IBInspectable private var textRectOffset: CGFloat = 20
    @IBInspectable private var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        setupView()
        
        super.awakeFromNib()
    }
    
    // Overidden methods
    // When you are looking at text in the text box without editing or modifying it
    // Where text is held
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    // Rectangle when you are actually typing text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    // Where placeholder text is held
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func setupView() {
        padding.left = textRectOffset
        
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        self.attributedPlaceholder = placeholder
    }

}
