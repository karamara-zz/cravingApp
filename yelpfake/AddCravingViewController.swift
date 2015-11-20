//
//  addCravingsViewController.swift
//  yelpfake
//
//  Created by Paul Kwon on 11/20/15.
//  Copyright © 2015 Paul Kwon. All rights reserved.
//

import UIKit

class addCravingViewController: UITableViewController {
    
    weak var cancelButtonDelegate: CancelButtonDelegate?
    
    
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        cancelButtonDelegate?.CancelButtonPressed(self)
    }
    
    @IBAction func doneButton(sender: UIBarButtonItem) {
    }
    
    @IBAction func locationButton(sender: UIButton) {
    }
    @IBOutlet weak var nameText: UITextField!
    
}
