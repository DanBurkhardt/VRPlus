//
//  PlaylistTableViewCell.swift
//  VRPlus
//
//  Created by Daniel Burkhardt on 4/18/17.
//  Copyright © 2017 Giganom LLC. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var byLabel: UILabel!
    @IBOutlet weak var descriptionBox: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
