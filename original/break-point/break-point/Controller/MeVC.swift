//
//  MeVCViewController.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/23/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Functions
    func setupView() {
        userEmailLbl.text = UserDataService.instance.userEmail
        userProfileImg.image = #imageLiteral(resourceName: "defaultProfileImage")
    }
    
    func signOutPopup() {
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            self.signUserOut()
        }
        
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
    
    func signUserOut() {
        do {
            try Auth.auth().signOut()
            let loginVC = storyboard?.instantiateViewController(withIdentifier: ID_SB_LOGIN_VC)
            self.present(loginVC!, animated: true, completion: nil)
        } catch {
            debugPrint("Can't sign out user: \(error.localizedDescription)")
        }
    }
    
    // IB-Actions
    @IBAction func signoutBtnPressed(_ sender: Any) {
        signOutPopup()
    }
}
