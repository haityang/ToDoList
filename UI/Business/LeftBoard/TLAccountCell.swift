//
//  TLAccountCell.swift
//  todolist
//
//  Created by yht on 05/11/2016.
//  Copyright © 2016 yht. All rights reserved.
//

import UIKit

class TLAccountCell: UITableViewCell {
    
    @IBOutlet weak var imgHeader: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgHeader.layer.cornerRadius = 30
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
