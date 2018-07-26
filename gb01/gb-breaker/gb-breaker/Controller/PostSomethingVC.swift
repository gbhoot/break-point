//
//  PostSomethingVC.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import Firebase

class PostSomethingVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var messageTxtView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    

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
        messageTxtView.delegate = self
    }
    
    func setupView() {
        sendBtn.isEnabled = false
        sendBtn.bindToKeyboard()
        userEmailLbl.text = UserDataService.instance.userEmail
    }
    
    func handleFeedPost() {
        MessageService.instance.uploadFeedMessage(withContent: messageTxtView.text!, fromSender: UserDataService.instance.userID, andEmail: UserDataService.instance.userEmail) { (success) in
            if success {
                print("Successfully uploaded message")
                dismiss(animated: true, completion: nil)
            } else {
                print("Something went horribly wrong")
            }
        }
    }
    
    // IB-Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if messageTxtView.text != "Say something here ..." {
            handleFeedPost()
        } else {
            debugPrint("Please post your message")
        }
    }
}

extension PostSomethingVC: UITextViewDelegate {
    
    // Methods
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            sendBtn.isEnabled = false
        } else {
            sendBtn.isEnabled = true
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Say something here ..." {
            textView.text = ""
        }
    }
}
