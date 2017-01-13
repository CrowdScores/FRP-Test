//
//  ViewController.swift
//  FRP-Test
//
//  Created by Ryan King on 13/01/2017.
//  Copyright © 2017 Ryan King. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class LoginViewController: UIViewController {

    @IBOutlet var usernameTextfield : UITextField!
    @IBOutlet var passwordTextfield : UITextField!
    @IBOutlet var signupButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setup the signup button initially
        self.signupButton.isEnabled = false
        signupButton.layer.cornerRadius = 4.0

        self.usernameTextfield.reactive.continuousTextValues.observeValues { (string) in
            if self.validTextFieldInput(input: string!) {
                self.signupButton.isEnabled = true
            } else {
                self.signupButton.isEnabled = false
            }
        }
        
        self.passwordTextfield.reactive.continuousTextValues.observeValues { (string) in
            if self.validTextFieldInput(input: string!) {
                self.signupButton.isEnabled = true
            } else {
                self.signupButton.isEnabled = false
            }
        }
    }
    
    func validTextFieldInput(input : String) -> Bool {
        return input.characters.count > 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

