//
//  CreatePostVC.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/23/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {
    
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
    
    // Functions
    func setupDelegates() {
        messageTxtView.delegate = self
    }
    
    func setupView() {
        sendBtn.isEnabled = false
        sendBtn.bindToKeyboard()
    }

    // IB-Actions
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessageBtnPressed(_ sender: Any) {
        if messageTxtView.text != nil && messageTxtView.text != "Say something here..." {
            sendBtn.isEnabled = true
            
            DataService.instance.uploadPost(withMessage: messageTxtView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete, error) in
                if isComplete {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print("There was an error")
                }
            }
        }
    }
}

extension CreatePostVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if messageTxtView.text == "Say something here..." {
            messageTxtView.text = ""
//            sendBtn.isEnabled = true
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if messageTxtView.text != nil {
            sendBtn.isEnabled = true
        } else {
            sendBtn.isEnabled = false
        }
    }
    
}
