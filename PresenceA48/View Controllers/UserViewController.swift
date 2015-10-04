//
//  UserViewController.swift
//  PresenceA48
//
//  Created by Adrian Wisaksana on 10/3/15.
//  Copyright © 2015 Quinn Baker. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var statusMessageLabel: UILabel!
    @IBOutlet weak var indicator: UIImageView!
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonTapped(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

}
