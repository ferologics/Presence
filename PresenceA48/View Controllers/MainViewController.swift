//
//  MainViewController.swift
//  PresenceA48
//
//  Created by Adrian Wisaksana on 10/3/15.
//  Copyright © 2015 Quinn Baker. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var baseButton: UIButton!
    
    
    // MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    func setup() {
        
        // user table view
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Actions
    
    @IBAction func baseButtonTapped(sender: UIButton) {
        
        if sender.selected {
            sender.selected = false
        } else {
            sender.selected = true
        }
        
    }

}


extension MainViewController: UITableViewDataSource {
    
    // set number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
    }
    
    // access rows at index path
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = usersTableView.dequeueReusableCellWithIdentifier("UserCell") as! UserTableViewCell
        
        return cell
        
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    // set row height
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 77
        
    }
    
    
    // on row selection 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        
    }
    
}