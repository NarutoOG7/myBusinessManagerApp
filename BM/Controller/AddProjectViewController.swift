//
//  AddProjectViewController.swift
//  BM
//
//  Created by Spencer Belton on 3/22/20.
//  Copyright © 2020 Spencer Belton. All rights reserved.
//

import UIKit
import Firebase

class AddProjectViewController: UIViewController {
    
    
    
    @IBOutlet weak var projectNameTextField: UITextField!
    @IBOutlet weak var clientNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        if let nameOfProject = projectNameTextField.text, let projectClient = clientNameTextField.text {
            db.collection(K.FStore.collectionName).addDocument(data:
                [K.FStore.projectNameField: nameOfProject,
                 K.FStore.clientNameField: projectClient]) { (error) in
                    if let e = error {
                        print("Issues saving data to Firestore, \(e)")
                    } else {
                        print("Successfully saved data to Firestore")
                        self.performSegue(withIdentifier: K.segues.projectAdded, sender: self)
                    }
            }
        }
        
    }
    
}
