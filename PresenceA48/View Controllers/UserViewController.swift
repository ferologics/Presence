//
//  UserViewController.swift
//  PresenceA48
//
//  Created by Adrian Wisaksana on 10/3/15.
//  Copyright © 2015 Quinn Baker. All rights reserved.
//

import UIKit

class UserViewController: UIViewController
{

    // MARK: - Properties
    
    var name: String?
    var status: String?
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusMessageLabel: UILabel!
    @IBOutlet weak var indicator: UIImageView!
    
    // MARK: - Methods
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.nameLabel.text = name!
        self.statusMessageLabel.text = status!
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonTapped(sender: UIButton)
    {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

}
