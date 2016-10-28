//
//  ChatViewController.swift
//  Parse-Client
//
//  Created by Haider Khan on 10/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var multiLineTextField: UITextField!
    @IBOutlet weak var chatTableViewBottomConstaint: NSLayoutConstraint!
    
    var messages: [NSDictionary] = []
    
    let refreshControl: UIRefreshControl = UIRefreshControl()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sendButton.layer.cornerRadius = 8.0
        
        // Add a refresh control
        refreshControl.backgroundColor = UIColor.white
        refreshControl.tintColor = UIColor.blue
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: UIControlEvents.valueChanged)
        self.chatTableView.addSubview(refreshControl)
        
        // Add an observer to the tableview 
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        // Set up a timer 
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(onChatMessagesRefreshFromTimer), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        // Get the username 
        let user = PFUser.current()
        let userName = user?.username
        
        // Check if text is not empty 
        let text = multiLineTextField.text
        if !(text?.isEmpty)! {
            
            // Go ahead and send the message
            let message = PFObject(className: "Message")
            message["text"] = text
            message["username"] = userName
            
            message.saveInBackground()
            
            // Clear our textfield
            multiLineTextField.text = ""
        }
        
        // go ahead and send off the message
    }
    
    @objc private func pullToRefresh() {
        
        // dismiss pull to refresh
        refreshControl.endRefreshing()
    }
    
    @objc private func keyboardWasShown(notification: NSNotification) {
        
        let info = notification.userInfo!
        let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    
        // Animate the height
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.chatTableViewBottomConstaint.constant = keyboardFrame.size.height + 60
        })
    }

    @objc private func onChatMessagesRefreshFromTimer() {
        
        // Load from parse
        let query = PFQuery(className: "Message")
        query.findObjectsInBackground(block: { (pfObject, error) in
         
            if error != nil {
                
                // We failed kill yourself
            } else {
                
                // Do something with results
                if let objects = pfObject as? PFObject {
                    for object in objects {
                        print(object.objectId)
                    }
                }
            }
        })
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chatCell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath)
        
        // Grab our message
        
        
        return nil
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
