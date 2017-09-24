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
    @IBOutlet weak var onlineImageView: UIImageView!
    
    let radiusRoundCorner: CGFloat = 50
    
    func prepareCell(with follower: Follower) {
        
        nameLabel.text = follower.name
        surnameLabel.text = follower.surname
        nameLabel.sizeToFit()
        surnameLabel.sizeToFit()
        onlineImageView.image = follower.online
        avatarImageView.image = follower.avatar
        avatarImageView.sizeToFit()
        onlineImageView.sizeToFit()
        avatarImageView.roundCorners( [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: radiusRoundCorner)
    }
}

