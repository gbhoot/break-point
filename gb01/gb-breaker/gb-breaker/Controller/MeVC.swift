//
//  MeVC.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class MeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // IB-Actions
    @IBAction func signOutBtnPressed(_ sender: Any) {
        AuthService.instance.signUserOut { (success) in
            if success {
                let loginVC = self.storyboard?.instantiateViewController(withIdentifier: ID_SB_LOGIN_VC)
                self.present(loginVC!, animated: true, completion: nil)
            } else {
                debugPrint("Something went horribly wrong")
            }
        }
    }
}
