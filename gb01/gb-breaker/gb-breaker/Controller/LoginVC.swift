//
//  LoginVC.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var bgImgHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginWithFBBtn: UIButton!
    @IBOutlet weak var loginWithGOOGBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkLoggedIn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Functions
    func checkLoggedIn() {
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func setupView() {
        bgImgHeightConstraint.constant = view.frame.height / 2
        loginWithFBBtn.isEnabled = false
        loginWithGOOGBtn.isEnabled = false
    }
}
