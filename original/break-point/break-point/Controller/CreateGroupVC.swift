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
    var contactsByEmail: [String] = [""]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Functions
    func setupView() {
        doneBtn.isHidden = true
    }
    
    // IB-Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func membersTextFieldDidChange(_ sender: Any) {
        
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactsTableView.dequeueReusableCell(withIdentifier: ID_TB_CONTACTS_CELL, for: indexPath) as? ContactsCell else { return UITableViewCell() }
        
        
        
        return cell
    }
    
}
