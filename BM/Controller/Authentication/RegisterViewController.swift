//
//  RegisterViewController.swift
//  BM
//
//  Created by Spencer Belton on 3/20/20.
//  Copyright © 2020 Spencer Belton. All rights reserved.
//

import UIKit
import Firebase


class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: K.segues.register, sender: self)
                }
                
            }
            
        }
        
        
    }
}
