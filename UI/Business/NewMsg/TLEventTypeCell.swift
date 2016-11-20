//
//  TLEventTypeCell.swift
//  todolist
//
//  Created by yht on 20/11/2016.
//  Copyright © 2016 yht. All rights reserved.
//

import UIKit

class TLEventTypeCell: UITableViewCell {

    @IBOutlet weak var imgCheck: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
