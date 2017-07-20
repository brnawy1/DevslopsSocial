//
//  DataService.swift
//  DevslopsSocial
//
//  Created by Ibrahim Adam on 10/24/1438 AH.
//  Copyright © 1438 Ibrahim Adam. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_POSTS: DatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    func createFirebaseDBUser(uid: String, userData: Dictionary<String, String>) {
        //We used this is to show POSTS and any CHILDREN under it in the TERMINAL
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
