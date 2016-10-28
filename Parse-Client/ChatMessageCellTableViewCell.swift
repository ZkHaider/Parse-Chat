//
//  ChatMessageCellTableViewCell.swift
//  Parse-Client
//
//  Created by Haider Khan on 10/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class ChatMessageCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    func setMessage(message: Message) {
        
        // Go ahead and set our message
        if message.message != nil {
            self.messageLabel.text = message.message
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
