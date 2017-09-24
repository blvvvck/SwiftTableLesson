//
//  FollowerTableViewCell.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 18/09/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import UIKit

class FollowerTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var onlineImage: UIImageView!
    
    func prepareCell(with follower: Follower) {
        
        nameLabel.text = follower.name
        surnameLabel.text = follower.surname
        nameLabel.sizeToFit()
        surnameLabel.sizeToFit()
        onlineImage.image = follower.online
        avatarImageView.image = follower.avatar
        avatarImageView.sizeToFit()
        onlineImage.sizeToFit()
        ViewController().imageCorners(with: avatarImageView)
    }
}

