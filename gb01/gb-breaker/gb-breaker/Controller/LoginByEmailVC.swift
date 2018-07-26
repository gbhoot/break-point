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
    @IBOutlet weak var invisibleView: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    

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
//        signInBtn.isEnabled = false
        invisibleView.isHidden = true
        stopSpinner()
    }
    
    func checkTextFields() {
//        if emailTxtField.text = "email"
    }
    
    func startSpinner() {
        invisibleView.isHidden = false
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func stopSpinner() {
        spinner.stopAnimating()
        spinner.isHidden = true
        invisibleView.isHidden = true
    }
    
    func handleSignIn() {
        if (emailTxtField.text?.isEmpty)! || (passwordTxtField.text?.isEmpty)! {
            print("Email/Password can't be empty")
        } else {
            let emailLower = emailTxtField.text?.lowercased()
            startSpinner()
            AuthService.instance.signUserIn(withEmail: emailLower!, andPassword: passwordTxtField.text!) { (success) in
                if success {
                    self.stopSpinner()
                    self.dismiss(animated: true, completion: nil)
                } else {
                    AuthService.instance.registerUser(withEmail: self.emailTxtField.text!, andPassword: self.passwordTxtField.text!, completion: { (success) in
                        if success {
                            AuthService.instance.signUserIn(withEmail: self.emailTxtField.text!, andPassword: self.passwordTxtField.text!, completion: { (success) in
                                if success {
                                    self.stopSpinner()
                                    self.dismiss(animated: true, completion: nil)
                                } else {
                                    debugPrint("Issue occurred")
                                }
                            })
                        }
                    })
                }
            }
        }
    }
    
    // IB-Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        self.view.endEditing(true)
        handleSignIn()
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
            handleSignIn()
        }
        
        return true
    }
}
