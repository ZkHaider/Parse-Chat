//
//  SignUpViewController.swift
//  Parse-Client
//
//  Created by Haider Khan on 10/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
        // Go ahead and grab the values from the textfields
        let userName = userNameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if !(userName?.isEmpty)! && !(email?.isEmpty)! && !(password?.isEmpty)! {

            let pfUser = PFUser()
            pfUser.username = userName
            pfUser.email = email
            pfUser.password = password
            
            pfUser.signUpInBackground(block: { (user , error) in
             
                if error != nil {
                    
                    print(error.debugDescription)
                    
                    // Do nothing and clear out textfields
                    self.userNameTextField.text = ""
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    
                } else {
                    
                    // Error does not exist show chat view controller
                    self.dismiss(animated: true, completion: nil)
                }

            })
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
