//
//  MeVC.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class MeVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userInfoTblView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Functions
    func setupTable() {
        userInfoTblView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func setupView() {
        userProfileImg.image = #imageLiteral(resourceName: "defaultProfileImage")
        userEmailLbl.text = UserDataService.instance.userEmail
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
