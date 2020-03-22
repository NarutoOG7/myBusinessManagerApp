//
//  HomeViewController.swift
//  BM
//
//  Created by Spencer Belton on 3/20/20.
//  Copyright © 2020 Spencer Belton. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    
    @IBOutlet weak var homeTableView: UITableView!
    
    var projects : [Project] = []
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTableView.dataSource = self
        homeTableView.delegate = self
        loadProjects()
        
        
    }
    
    @IBAction func menuButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.segues.homeToMenu, sender: self)
    }
    
    @IBAction func addProjectButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: K.segues.homeToAddProject, sender: self)
    }
    
    
    func loadProjects() {
        
        projects = []
        
        let db = Firestore.firestore()
        
        db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let e = error {
                print("Error retrieving data from FIRESTORE, \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let user = data[K.FStore.userField] as? String, let projectName = data[K.FStore.projectNameField] as? String {
                            let newProject = Project(client: user, projectName: projectName)
                            self.projects.append(newProject)
                            
                            
                            DispatchQueue.main.async {
                                self.homeTableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    
}

//MARK: - TableView Data Source

extension HomeViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cells.homeCell, for: indexPath)
        cell.textLabel?.text = projects[indexPath.row].projectName
        return cell
        
    }
}


//MARK: - TableView Delegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.segues.homeToProject, sender: self)
    }
    
}
