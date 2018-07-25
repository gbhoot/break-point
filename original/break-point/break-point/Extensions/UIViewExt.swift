//
//  UIViewExt.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/23/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    func unbindFromKeyboard() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        
        let interval = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let startingY = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingY = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let deltaY = endingY.origin.y - startingY.origin.y
        
        UIView.animate(withDuration: interval) {
            self.frame.origin.y += deltaY
        }
    }
}
