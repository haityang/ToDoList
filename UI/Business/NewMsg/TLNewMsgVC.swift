//
//  TLNewMsgVC.swift
//  todolist
//
//  Created by yht on 06/11/2016.
//  Copyright © 2016 yht. All rights reserved.
//

import UIKit

enum MsgNewItem {
    case Title
    case Content
    case Kind
}

class TLNewMsgVC: UIViewController, UITableViewDataSource, UITableViewDelegate, TLEventTypeProtocol {

    @IBOutlet weak var tableView: UITableView!
    var cellTypes: NSArray!
    var eventType: TMsgType = TMsgType.tMsgTypeEI
    var tfEventTitle: UITextField?
    var tvEventContent: UITextView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupLeftMenuButton()
        self.setupRightMenuButton()
        self.navigationItem.title = "创建一项事件"
        
        cellTypes = [MsgNewItem.Title, MsgNewItem.Content, MsgNewItem.Kind]
        
        var nib = UINib(nibName: "TLNewMsgCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TLNewMsgCell")
        
        nib = UINib(nibName: "TLNewMsgTypeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TLNewMsgTypeCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let op = SQLiteOper.shared;
        //op.sample()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell: TLNewMsgCell? = tableView.dequeueReusableCell(withIdentifier: "TLNewMsgCell") as! TLNewMsgCell?
            cell?.lbTitle.text = "标题"
            cell?.lbContent.text = "为事件起个名字"
            return cell!
            
        }else if indexPath.row == 1 {
            let cell: TLNewMsgCell? = tableView.dequeueReusableCell(withIdentifier: "TLNewMsgCell") as! TLNewMsgCell?
            cell?.lbTitle.text = "内容"
            cell?.lbContent.text = "写下你要做的事情"
            return cell!
            
        }else {
            let cell: TLNewMsgTypeCell? = tableView.dequeueReusableCell(withIdentifier: "TLNewMsgTypeCell") as! TLNewMsgTypeCell?
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 44
        }else if indexPath.row == 1 {
            return 132
        }else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            let eventVC = TLEventTypeController()
            self.navigationController?.pushViewController(eventVC, animated: true)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func setupLeftMenuButton() {
        let leftButton = UIBarButtonItem(title:"取消", style:UIBarButtonItemStyle.plain, target:self, action:#selector(leftBtnPress(_:)))
        self.navigationItem.setLeftBarButton(leftButton, animated: true)
    }
    
    func setupRightMenuButton() {
        let rightButton = UIBarButtonItem(title:"保存", style:UIBarButtonItemStyle.plain, target:self, action:#selector(rightBtnPress(_:)))
        self.navigationItem.setRightBarButton(rightButton, animated: true)
    }
    
    func leftBtnPress(_ sender: AnyObject?) -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
    func rightBtnPress(_ sender:AnyObject?) -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //delegate 
    func didSelectType(type:TMsgType) {
        eventType = type
    }
}
