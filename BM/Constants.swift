//
//  Constants.swift
//  BM
//
//  Created by Spencer Belton on 3/21/20.
//  Copyright © 2020 Spencer Belton. All rights reserved.
//

import Foundation


struct K {
    
    
    struct segues {
        static let register = "register"
        static let login = "login"
        
        static let homeToProject = "homeToProject"
        static let homeToMenu = "goToMenu"
        static let homeToAddProject = "homeToAddProject"
        
        static let menuToMaterials = "menuToMaterials"
        static let menuToCalendar = "menuToCalendar"
        static let menuToAccount = "menuToAccount"
        static let menuToSettings = "menuToSettings"
        
        static let projectAdded = "projectAdded"
        
        static let goToHome = "goToHome"
    }
    
    
    struct cells {
        static let homeCell = "homeCell"
        static let menuCell = "menuCell"
    }
 
    struct FStore {
        static let collectionName = "projects"
        static let userField = "user"
        static let projectNameField = "name"
        static let clientNameField = "client"
        
    }
    
}

