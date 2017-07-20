//
//  FeedVC.swift
//  DevslopsSocial
//
//  Created by Ibrahim Adam on 10/18/1438 AH.
//  Copyright © 1438 Ibrahim Adam. All rights reserved.
//

import UIKit
import FirebaseAuth
import SwiftKeychainWrapper

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //This is to show POSTS and any CHILDREN under it in the TERMINAL
        DataService.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshot {
                    print("SNAP: \(snap)")
                    if let postDict = snap.value as Dictionary<String, Any> {
                        let key = snap.key
                        let post = Post(postID: key, postData: postDict)
                        self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }
    
    @IBAction func signOutBtnTapped(_ sender: Any) {
        
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("IBRAHIM: ID removed from keychain\(keychainResult)")
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignOut", sender: nil)
    }
}
