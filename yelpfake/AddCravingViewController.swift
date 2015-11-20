//
//  AddCravingViewController.swift
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
        
       // if let craving = cravingToEdit {
        //    craving.rest_name = rest
       // }
    }
    
    @IBAction func locationButton(sender: UIButton) {
        //self.tag =
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "LocationSWay" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! MapViewController
            
        }
    }

}
