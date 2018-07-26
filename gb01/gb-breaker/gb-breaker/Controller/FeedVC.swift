//
//  FirstViewController.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var feedMessagesTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        setupDelegates()
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
    func setupDelegates() {
        feedMessagesTblView.delegate = self
        feedMessagesTblView.dataSource = self
    }
    
    func setupTable() {
        feedMessagesTblView.tableFooterView = UIView(frame: CGRect.zero)
        MessageService.instance.downloadFeedMessages { (success) in
            if success {
                print(MessageService.instance.feedMessages.count    )
                self.feedMessagesTblView.reloadData()
            }
        }
    }
    
    // IB-Actions
    
    
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    // Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.feedMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ID_TBL_FEED_CELL, for: indexPath) as? FeedCell else { return UITableViewCell() }
        
        cell.configureCell(email: MessageService.instance.feedMessages[indexPath.row].senderEmail, message: MessageService.instance.feedMessages[indexPath.row].content)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
