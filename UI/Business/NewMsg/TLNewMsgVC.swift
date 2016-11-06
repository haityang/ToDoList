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

class TLNewMsgVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var cellTypes: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupLeftMenuButton()
        self.setupRightMenuButton()
        self.navigationItem.title = "有计划，就从容"
        
        cellTypes = [MsgNewItem.Title, MsgNewItem.Content, MsgNewItem.Kind]
        
        var nib = UINib(nibName: "TLNewMsgCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TLNewMsgCell")
        
        nib = UINib(nibName: "TLNewMsgTypeCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TLNewMsgTypeCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 || indexPath.row == 1 {
            let cell: TLNewMsgCell? = tableView.dequeueReusableCell(withIdentifier: "TLNewMsgCell") as! TLNewMsgCell?
            return cell!
            
        }else {
            let cell: TLNewMsgTypeCell? = tableView.dequeueReusableCell(withIdentifier: "TLNewMsgTypeCell") as! TLNewMsgTypeCell?
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 1 {
            return 44
        }
        return 44
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
        
        let image = UIImage(named: "mobile-icon-home-black")
        let leftDrawerButton = UIBarButtonItem(image:image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(TListMsgController.leftDrawerButtonPress(_:)))
        self.navigationItem.setLeftBarButton(leftDrawerButton, animated: true)
    }
    
    func setupRightMenuButton() {
        
        let image = UIImage(named: "mobile-icon-follow-black")
        let rightDrawerButton = UIBarButtonItem(image:image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(TListMsgController.rightDrawerButtonPress(_:)))
        self.navigationItem.setRightBarButton(rightDrawerButton, animated: true)
    }

}
