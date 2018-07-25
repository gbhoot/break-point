//
//  NewGroupVC.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/24/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var membersTextField: UITextField!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var contactsTableView: UITableView!
    
    // Variables
    var contactsByEmail = [String]()

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
    
    // Functions
    func setupDelegates() {
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        membersTextField.delegate = self
//        titleTextField.delegate = self
//        descTextField.delegate = self
    }
    
    func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
    func setupView() {
        doneBtn.isHidden = true
    }
    
    @objc func handleTap() {
        self.view.endEditing(true)
    }
    
    // IB-Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func membersTextFieldDidChange(_ sender: Any) {
//        self.view.bindTxoKeyboard()
        if membersTextField.text != "" {
            
            let emailLower = membersTextField.text?.lowercased()
                UserDataService.instance.searchEmailAddresses(forSearchQuery: emailLower!) { (emailArray) in
                self.contactsByEmail = emailArray
                self.contactsTableView.reloadData()
            }
        } else {
            contactsByEmail.removeAll()
            self.contactsTableView.reloadData()
        }
    
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        
    }
}

extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    
    // Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsByEmail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactsTableView.dequeueReusableCell(withIdentifier: ID_TB_CONTACTS_CELL, for: indexPath) as? ContactsCell else { return UITableViewCell() }
        
        cell.configureCell(email: contactsByEmail[indexPath
            .row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = contactsTableView.cellForRow(at: indexPath) as? ContactsCell else { return }
        
        cell.configureCheckMark()
    }
}

extension CreateGroupVC: UITextFieldDelegate {
 
    // Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        self.view.bindToKeyboard()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        self.view.unbindFromKeyboard()
//        self.resignFirstResponder()
    }
    
}
