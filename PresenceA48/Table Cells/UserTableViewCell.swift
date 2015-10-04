//
//  UserTableViewCell.swift
//  PresenceA48
//
//  Created by Adrian Wisaksana on 10/3/15.
//  Copyright © 2015 Quinn Baker. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var indicator: UIImageView!
    
    
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
