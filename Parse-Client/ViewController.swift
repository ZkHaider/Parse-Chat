//
//  ViewController.swift
//  Parse-Client
//
//  Created by Haider Khan on 10/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Go ahead and check if current user exists
        let user = PFUser.current()
        if user != nil {
            
            // We are already logged show chat view controller
            goToChat()
            
        } else {
            
            goToSignUp()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Get called again check here if the user is valid
        let user = PFUser.current()
        if user != nil {
            
            // Then show the chat view controller 
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func goToSignUp() {
        
        // Show the sign up view controller
        // Go ahead and show login view controller
        let signUpViewController = storyboard?.instantiateViewController(withIdentifier: "signUpViewController") as! SignUpViewController
        
        DispatchQueue.main.async {
            self.present(signUpViewController, animated: true, completion: nil)
        }
    }
    
    private func goToChat() {
        
        // Show chat 
        let chatViewController = storyboard?.instantiateViewController(withIdentifier: "chatViewController") as! ChatViewController
        
        DispatchQueue.main.async {
            self.present(chatViewController, animated: true, completion: nil)
        }
    }


}

