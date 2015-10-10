//
//  ParseHelper.swift
//  PresenceA48
//
//  Created by Adrian Wisaksana on 10/8/15.
//  Copyright © 2015 Quinn Baker. All rights reserved.
//

import Foundation
import Parse
import FBSDKCoreKit


class ParseHelper
{
    static let ParseUserClass = "_User"
    
    static func requestUsers(completionBlock: (users: [PFUser]?, error: NSError?) -> Void)
    {
        let query = PFQuery(className: ParseUserClass)
        query.findObjectsInBackgroundWithBlock()
        { (objects, error) in
            // removable
            if (error != nil)
            {
                print(error?.description)
            }
            
            if let users = objects as? [PFUser]
            {
                completionBlock(users: users, error: nil)
            }
        }
    }
    
    static func requestUserStatus(user: PFUser) -> String
    {
        if let userStatus = user.valueForKey("status") as? String
        {
            return userStatus
        }
        else
        {
            return "Error fetching data"
        }

    }
    
    static func requestUserProfilePicture(user: PFUser) -> UIImage?
    {
        let path = user.valueForKey("picture") as! String
        
        if let url = NSURL(string: path)
        {
            if let data = NSData(contentsOfURL: url)
            {
                let image = UIImage(data: data)
                return image
            }
        }

        return nil
    }
    
    
}