//
//  MainInfoTableViewCell.swift
//  VKDesign(11September)
//
//  Created by BLVCK on 22/09/2017.
//  Copyright © 2017 blvvvck production. All rights reserved.
//

import UIKit

class MainInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var sutitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func prepateCell(with mainInfo: MainInfo) {
        sutitleLabel.text = mainInfo.info
        titleLabel.text = mainInfo.title
        sutitleLabel.sizeToFit()
        titleLabel.sizeToFit()
    }
}
