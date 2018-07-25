//
//  IndentTextField.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

@IBDesignable

class PaddedTextField: UITextField {
    
    @IBInspectable var horizontalPadding: CGFloat = 20
    @IBInspectable var verticalPadding: CGFloat = 0
    @IBInspectable var edgeInset = UIEdgeInsets.zero

    override func awakeFromNib() {
        customizeView()
        super.awakeFromNib()
    }
    
    // Functions
    func customizeView() {
        edgeInset.left = horizontalPadding
        edgeInset.top = verticalPadding
        
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        self.attributedPlaceholder = placeholder
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, edgeInset)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, edgeInset)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, edgeInset)
    }
    
}
