//
//  RegisterViewController.swift
//  yelpfake
//
//  Created by Paul Kwon on 11/19/15.
//  Copyright © 2015 Paul Kwon. All rights reserved.
//

import UIKit


class RegisterViewController: UIViewController {
    
    weak var cancelButtonDelegate: CancelButtonDelegate?
        
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        cancelButtonDelegate?.CancelButtonPressed(self)
    }
    
    @IBAction func registerButton(sender: UIBarButtonItem) {
    }
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var c_passwordText: UITextField!
    
    @IBOutlet weak var phoneText: UITextField!
    
    @IBOutlet weak var genderText: UITextField!
    
    @IBOutlet weak var hobbiesText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
