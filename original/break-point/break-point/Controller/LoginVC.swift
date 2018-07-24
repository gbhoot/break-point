//
//  LoginVC.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/20/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import Firebase

@IBDesignable

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IB-Actions
    @IBAction func loginFBBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func loginGOOGBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func loginByEmailBtnPressed(_ sender: Any) {
        let loginEmailVC = storyboard?.instantiateViewController(withIdentifier: ID_SB_LOGIN_EMAIL_VC)
        present(loginEmailVC!, animated: true, completion: nil)
    }
}
