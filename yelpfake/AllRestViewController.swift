//
//  RestaurantsTableViewController.swift
//  yelpfake
//
//  Created by Paul Kwon on 11/19/15.
//  Copyright © 2015 Paul Kwon. All rights reserved.
//

import UIKit

class allRestaurantsTableViewController: UITableViewController, UISearchResultsUpdating,CancelButtonDelegate
{
    
    var rest_name =  ["Chipotle", "Sushi Land", "Wendy", "BurgerKing", "Burger Broiler"]
    var user_name = ["Sung", "Paul", "Jane", "Sung", "Jane"]
    
    var filteredRest_name = [String]()
    
    var resultSearchController = UISearchController()
    
    //UISearchResultUpdatingDelegate
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredRest_name.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        
        let array = (self.rest_name as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
        self.filteredRest_name = array as! [String]
        
        self.tableView.reloadData()
    }
    
    //CancelButton Delegate
    func CancelButtonPressed(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Init a new SearchController
        self.resultSearchController = UISearchController(searchResultsController: nil)
        
        //SearchTableView will conform to become the updater(UISerachResultUpdatingDelegate)
        self.resultSearchController.searchResultsUpdater = self
        
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        
        //Fits the whole width of the viewcontroller
        self.resultSearchController.searchBar.sizeToFit()
        
        //Setting the searchbar to be the header of the viewcontroller
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        
        self.tableView.reloadData()
    }
//    override func viewWillAppear(animated: Bool) {
//        tableView.reloadData()
//        super.viewWillAppear(animated)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.resultSearchController.active {
            return self.filteredRest_name.count
        } else {
            return rest_name.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! JoinCustomCell
        
        if self.resultSearchController.active {
            
            cell.restaurantLabel?.text = self.filteredRest_name[indexPath.row]
            //cell.createdByLabel?.text = self.
            cell.joinButton?.tag = indexPath.row //Check if the join button works
            
        } else {
            
            cell.restaurantLabel?.text = rest_name[indexPath.row]
        
            cell.createdByLabel?.text = user_name[indexPath.row]

            cell.joinButton?.tag = indexPath.row
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "RestInfoSWay" {
            
            let navigationController = segue.destinationViewController as! UINavigationController
            
            let controller = navigationController.topViewController as! RestaurantInfoViewController
            
            controller.cancelButtonDelegate = self
        }
    }


}
