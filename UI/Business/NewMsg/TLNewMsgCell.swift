//
//  TLNewMsgCell.swift
//  todolist
//
//  Created by yht on 06/11/2016.
//  Copyright © 2016 yht. All rights reserved.
//

import UIKit

class TLNewMsgCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
