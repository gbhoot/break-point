//
//  LoginByEmailVC.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

@IBDesignable

class LoginByEmailVC: UIViewController {
    
    // Outlets
    @IBOutlet @IBInspectable weak var emailTxtField: PaddedTextField!
    @IBOutlet @IBInspectable weak var passwordTxtField: PaddedTextField!
    @IBOutlet weak var signInBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupDelegates()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Functions
    func setupDelegates() {
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
    }
    
    func setupView() {
        signInBtn.isEnabled = false
    }
    
    // IB-Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginByEmailVC: UITextFieldDelegate {
    
    // Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTxtField {
            textField.resignFirstResponder()
            passwordTxtField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
