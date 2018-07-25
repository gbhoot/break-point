//
//  LoginByEmailVC.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/20/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import Firebase

class LoginByEmailVC: UIViewController {
    
    
    @IBOutlet weak var emailTxtField: InsetTextField!
    @IBOutlet weak var passwordTxtField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Functions
    func setupDelegates() {
        emailTxtField.delegate = self
        passwordTxtField.delegate = self
    }
    
    func setupView() {
        
    }
    
    // IB-Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        if emailTxtField.text != nil && passwordTxtField.text != nil {
            let email = emailTxtField.text?.lowercased()
            AuthService.instance.loginUser(withEmail: email!, andPassword: passwordTxtField.text!) { (success, loginError) in
                if success {
                    UserDataService.instance.setUserData()
                    print(UserDataService.instance.userEmail)
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                    AuthService.instance.registerUser(withEmail: email!, andPassword: self.passwordTxtField.text!, userCreationComplete: { (sucess, registrationError) in
                        if success {
                            AuthService.instance.loginUser(withEmail: email!, andPassword: self.passwordTxtField.text!, loginComplete: { (success, nil) in
                                UserDataService.instance.setUserData()
                                print(UserDataService.instance.userEmail)
                                self.dismiss(animated: true, completion: nil)
                            })
                        } else {
                            print(String(describing: registrationError?.localizedDescription))
                        }
                    })
                }
            }
        }
    }
}

extension LoginByEmailVC: UITextFieldDelegate {
    
}
