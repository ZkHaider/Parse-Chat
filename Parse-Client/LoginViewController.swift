//
//  LoginViewController.swift
//  Parse-Client
//
//  Created by Haider Khan on 10/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initializeLoginButton()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initializeLoginButton() {
        
        // Set the corner radius 
        loginButton.layer.cornerRadius = 8
        loginButton.layer.shadowRadius = 4
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = CGSize.zero
        loginButton.layer.shadowOpacity = 0.7
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        // Go ahead and grab the values from the textfields
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if !(email?.isEmpty)! && !(password?.isEmpty)! {
            
            PFUser.logInWithUsername(inBackground: email!, password: password!, block: { (user, error) in
                
                if error != nil {
                    
                    print(error.debugDescription)
                    
                    // Do nothing and clear out textfields
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    
                } else {
                    
                    // Error does not exist show chat view controller
                    self.dismiss(animated: true, completion: nil)
                }
            })
        }

    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
    
        // Dismiss view controller
        self.dismiss(animated: true, completion: nil)
    }
    
    private func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
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
