//
//  TLEventTypeController.swift
//  todolist
//
//  Created by yht on 20/11/2016.
//  Copyright © 2016 yht. All rights reserved.
//

import UIKit

protocol TLEventTypeProtocol {
    func didSelectType(type:TMsgType)
}


class TLEventTypeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let eventTypes:[(type:TMsgType, title:String)] = [(TMsgType.tMsgTypeEI, "紧急重要"), (TMsgType.tMsgTypeEUI, "紧急不重要"), (TMsgType.tMsgTypeUEI, "不紧急重要"), (TMsgType.tmsgTypeUEUI, "不紧急不重要")]
    var currType:TMsgType = TMsgType.tMsgTypeEI
    var currPath:IndexPath?
    var delegate: TLEventTypeProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "TLEventTypeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TLEventTypeCell")
        tableView.delegate = self;
        tableView.dataSource = self;
        
        
        self.setupRightMenuButton()
        self.navigationItem.title = "选择事件类型"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TLEventTypeCell? = tableView.dequeueReusableCell(withIdentifier:  "TLEventTypeCell") as! TLEventTypeCell?
        
        cell?.selectionStyle = UITableViewCellSelectionStyle.none
        
        let eventType = eventTypes[indexPath.row]
        if eventType.type == currType {
            cell?.imgCheck.isHidden = false;
            currPath = indexPath
        }else {
            cell?.imgCheck.isHidden = true;
        }
        cell?.lbTitle.text = eventType.title;
        
         return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eventType = eventTypes[indexPath.row]
        currType = eventType.type
        
        var currCell = tableView.cellForRow(at: currPath!) as! TLEventTypeCell?
        currCell?.imgCheck.isHidden = true
        currPath = indexPath
        currCell = tableView.cellForRow(at: currPath!) as! TLEventTypeCell?
        currCell?.imgCheck.isHidden = false;
        
        if (delegate != nil) {
            delegate?.didSelectType(type: currType)
        }
    }
    
    
    func setupRightMenuButton() {
        let rightButton = UIBarButtonItem(title:"完成", style:UIBarButtonItemStyle.plain, target:self, action:#selector(rightBtnPress(_:)))
        self.navigationItem.setRightBarButton(rightButton, animated: true)
    }
    
    
    func rightBtnPress(_ sender:AnyObject?) -> Void {
        let _ = self.navigationController?.popViewController(animated: true)
    }

}
