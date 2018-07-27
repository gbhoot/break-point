//
//  CreateGroupVC.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/26/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var groupTitleTxtField: PaddedTextField!
    @IBOutlet weak var groupDescTxtField: PaddedTextField!
    @IBOutlet weak var groupMembersTxtField: PaddedTextField!
    @IBOutlet weak var groupMembersLbl: UILabel!
    @IBOutlet weak var groupMembersTblView: UITableView!
    @IBOutlet weak var doneBtn: UIButton!
    
    // Variables
    var memberEmails = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupDelegates()
        setupView()
        
        createGroupTrial()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func createGroupTrial() {
        let group = Group(title: "Klein", description: "underwear only", users: ["g@b.com", "bob@bob.com", "harvey@dent.com"])
        let groupUsers = group.groupUsers
        for user in groupUsers {
            DatabaseService.instance.addGroupToUser(withGroupID: group.groupTitle, forUser: user) { (success) in
                if success {
                    print("Good")
                }
            }
        }
        DatabaseService.instance.createDBGroup(withGroup: group)
    }
    
    func setupDelegates() {
        groupMembersTxtField.delegate = self
        groupMembersTblView.delegate = self
        groupMembersTblView.dataSource = self
    }
    
    func setupTable() {
        groupMembersTblView.reloadData()
    }
    
    func setupView() {
        doneBtn.isHidden = true
        doneBtn.isEnabled = false
    }
    
    func searchEmails() {
        let emailLower = groupMembersTxtField.text?.lowercased()
        DatabaseService.instance.downloadDBUserEmails(withSearch: emailLower!) { (emailArray, error) in
            self.memberEmails = emailArray
            self.groupMembersTblView.reloadData()
        }
    }
    
    // IB-Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func memberTxtFieldChanged(_ sender: Any) {
        if groupMembersTxtField.text != "" {
            self.searchEmails()
        } else {
            self.memberEmails.removeAll()
            
            print("Need to insert proper emails")
        }
        
        groupMembersTblView.reloadData()
    }
}

extension CreateGroupVC: UITextFieldDelegate {
    
    // Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == groupMembersTxtField {
            self.view.bindToKeyboard()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == groupMembersTxtField {
            self.view.unbindFromKeyboard()
        }
    }
    
    
}

extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    
    // Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberEmails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ID_TBL_MEMBER_CELL, for: indexPath) as? MemberCell else { return UITableViewCell() }
        
        cell.configureCell(email: memberEmails[indexPath.row])
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
