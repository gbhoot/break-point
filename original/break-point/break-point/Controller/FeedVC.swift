//
//  FirstViewController.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/20/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var feedTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupDelegates()
//        setupTable()
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
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
    func setupTable() {
        MessageService.instance.getAllFeedMessages { (success, error) in
            if success {
                self.feedTableView.reloadData()
            }
        }
//        print(DataService.instance.messagesFeed.count)
    }
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.messagesFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = feedTableView.dequeueReusableCell(withIdentifier: ID_TB_FEED_CELL, for: indexPath) as? FeedCell else { return UITableViewCell() }

        let message = MessageService.instance.messagesFeed[indexPath.row]
        UserDataService.instance.getUserEmail(forUID: message.senderID) { (userEmail) in
            cell.configureCell(email: userEmail, message: message.content)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
}
