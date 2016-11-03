//
//  TLLeftTitleCell.swift
//  todolist
//
//  Created by yht on 02/11/2016.
//  Copyright © 2016 yht. All rights reserved.
//

import UIKit

class TLLeftTitleCell: UITableViewCell {
    
    @IBOutlet weak var iconSymbol: UIImageView!
    
    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func setupCell(cell:TLLeftTitleCell?, item:TLeftTitleItem?) ->Int {
        if (cell != nil && item != nil) {
            cell!.iconSymbol.image = UIImage(named: item!.imageURL!)
            cell!.lbTitle.text = item!.title
            return 0
            
        }else {
            return 20
        }
        
    }
    
    
}
