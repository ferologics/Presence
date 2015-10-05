//
//  MainViewController.swift
//  PresenceA48
//
//  Created by Adrian Wisaksana on 10/3/15.
//  Copyright © 2015 Quinn Baker. All rights reserved.
//

import UIKit

class MainViewController: UIViewController
{
    // MARK: Properties
    
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var baseButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarTopConstraint: NSLayoutConstraint!
    
    var listButton: UIButton!
    var searchButton: UIButton!
    
    // MARK: Methods

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup()
    {
        // user table view
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
        // button settings and initiation
        let buttonFrame = baseButton.frame
        let buttonCenter = baseButton.center
        
        listButton = UIButton(frame: buttonFrame)
        listButton.frame = buttonFrame
        listButton.center = buttonCenter
        listButton.setBackgroundImage(UIImage(named: "List Button"), forState: UIControlState.Normal)
        listButton.addTarget(self, action: "listButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        listButton.hidden = true
        
        searchButton = UIButton(frame: buttonFrame)
        searchButton.center = buttonCenter
        searchButton.setBackgroundImage(UIImage(named: "Search Button"), forState: UIControlState.Normal)
        searchButton.addTarget(self, action: "searchButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        searchButton.hidden = true
        let selectedSearchButtonImage = UIImage(named: "Search Button - Selected")
        searchButton.setImage(selectedSearchButtonImage, forState: .Selected)
        
        self.view.insertSubview(self.searchButton, atIndex: 3)
        self.view.insertSubview(self.listButton, atIndex: 4)
        
        // search bar settings
        searchBar.delegate = self

    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    override func prefersStatusBarHidden() -> Bool { return true }

    
    // MARK: - Actions
    
    @IBAction func baseButtonTapped(sender: UIButton)
    {
        // base button togle
        let buttonMargin: CGFloat = 66
        
        if sender.selected
        {
            // deselect base button
            sender.selected = false
            UIView.animateWithDuration(0.13, animations:
            {
                self.searchButton.center = CGPointMake(self.searchButton.center.x + buttonMargin, self.baseButton.center.y)
            },
            completion:
            { void in
                    UIView.animateWithDuration(0.2, animations:
                        {
                            self.listButton.center = CGPointMake(self.listButton.center.x + buttonMargin, self.baseButton.center.y)
                            self.searchButton.center = CGPointMake(self.searchButton.center.x + buttonMargin, self.baseButton.center.y)
                        },
                        completion:
                        { void in
                            self.listButton.hidden = true
                            self.searchButton.hidden = true
                    })
            })
        
        }
        else
        {
            // select base button
            sender.selected = true
            UIView.animateWithDuration(0.1, animations:
                {
                self.listButton.hidden = false
                self.searchButton.hidden = false
                self.listButton.center = CGPointMake(self.baseButton.center.x - buttonMargin, self.baseButton.center.y)
                self.searchButton.center = CGPointMake(self.baseButton.center.x - buttonMargin, self.baseButton.center.y)
                },
                completion:
                { void in
                    UIView.animateWithDuration(0.1, animations:
                        {
                            self.searchButton.center = CGPointMake(self.searchButton.center.x - buttonMargin, self.baseButton.center.y)
                        })
            })
        }
    }
    
    @IBAction func listButtonTapped(sender: UIButton)
    {
        
        // apply filtering code here
        
    }
    
    @IBAction func searchButtonTapped(sender: UIButton)
    {

        if sender.selected
        {
            // deselect
            sender.selected = false
            UIView.animateWithDuration(0.5, animations:
            {
                self.searchBarTopConstraint.constant = -44
                self.view.layoutIfNeeded()
            })
        } else
        {
            // select
            sender.selected = true
            UIView.animateWithDuration(0.5, animations:
            {
                self.searchBarTopConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
        }
        
    }

}


extension MainViewController: UITableViewDataSource
{
    
    // set number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    
    // access rows at index path
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = usersTableView.dequeueReusableCellWithIdentifier("UserCell") as! UserTableViewCell
        
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate
{
    // set row height
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 77
    }
    
    
    // on row selection 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        // deselect row
        usersTableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        performSegueWithIdentifier("UserViewControllerSegue", sender: self)
    }
}

extension MainViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        searchButton.selected = false
        UIView.animateWithDuration(0.5, animations:
            {
                self.searchBarTopConstraint.constant = -44
                self.view.layoutIfNeeded()
        })
        
    }
    
}