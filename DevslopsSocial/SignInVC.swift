//
//  SignInVC.swift
//  DevslopsSocial
//
//  Created by Ibrahim Adam on 10/12/1438 AH.
//  Copyright © 1438 Ibrahim Adam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKCoreKit
import FBSDKLoginKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailFeild: FancyTextFeild!
    @IBOutlet weak var pwdFeild: FancyTextFeild!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("IBRAHIM: Unable to authenticate with Facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("IBRAHIM: User cancelled Facebook authentication")
            } else {
                print("IBRAHIM: Successfully authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("IBRAHIM: Unable to authenticate with firebase - \(String(describing: error))")
            } else {
                print("IBRAHIM: Successfully authenticated with Firebase")
            }
        })
    }

@IBAction func signInBtnTapped(_ sender: Any) {
        
        if let email = emailFeild.text, let pwd = pwdFeild.text {
            Auth.auth().signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("IBRAHIM: Email user authenticated with Firebase")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("IBRAHIM: Unable to authenticate with Firebase using email")
                        } else {
                            print("IBRAHIM: Successfully authenticated with Firebase")
                        }
                    })
                }
            })
        }
    }
    
}


























