//
//  TLNewMsgCell.swift
//  todolist
//
//  Created by yht on 06/11/2016.
//  Copyright © 2016 yht. All rights reserved.
//

import UIKit

class TLNewMsgCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbContent: UITextView!
    
    var placeHolder: NSString?
    var placeColor: UIColor?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbContent.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if placeHolder != nil {
            if textView.text! == placeHolder! as String {
                textView.text = "";
                textView.textColor = UIColor.black//optional
            }
        }

        textView.becomeFirstResponder()
    }
    

    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = placeHolder as String!
            textView.textColor = placeColor
        }
        textView.resignFirstResponder()
    }
}
