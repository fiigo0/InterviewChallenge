//
//  VideoCellVC.swift
//  Charter
//
//  Created by Alex Díaz on 6/15/17.
//  Copyright © 2017 Alex Díaz. All rights reserved.
//

import UIKit

class VideoCellVC: UITableViewCell {
  
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
