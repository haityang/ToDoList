//
//  TListMsgController.swift
//  todolist
//
//  Created by yht on 3/12/16.
//  Copyright © 2016 yht. All rights reserved.
//

import UIKit
import DrawerController

class TListMsgController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableMsg: UITableView!
    var listCell: TListMsgCell!
    let idListMsgCell = "idTListMsgCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupLeftMenuButton()
        self.setupRightMenuButton()
        self.navigationItem.title = "有计划，就从容"
        
        let nib = UINib(nibName: "TListMsgCell", bundle: nil)
        tableMsg.register(nib, forCellReuseIdentifier: idListMsgCell)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TListMsgCell? = tableView.dequeueReusableCell(withIdentifier: idListMsgCell) as! TListMsgCell?
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func setupLeftMenuButton() {
//        let leftDrawerButton = DrawerBarButtonItem(target: self, action: #selector(TListMsgController.leftDrawerButtonPress(_:)))
        
        let image = UIImage(named: "mobile-icon-home-black")
        let leftDrawerButton = UIBarButtonItem(image:image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(TListMsgController.leftDrawerButtonPress(_:)))
        self.navigationItem.setLeftBarButton(leftDrawerButton, animated: true)
    }
    
    func setupRightMenuButton() {
//        let rightDrawerButton = DrawerBarButtonItem(target: self, action: #selector(TListMsgController.rightDrawerButtonPress(_:)))

        let image = UIImage(named: "mobile-icon-follow-black")
        let rightDrawerButton = UIBarButtonItem(image:image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(TListMsgController.rightDrawerButtonPress(_:)))
        self.navigationItem.setRightBarButton(rightDrawerButton, animated: true)
    }

    
    func leftDrawerButtonPress(_ sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.left, animated: true, completion: nil)
    }
    
    func rightDrawerButtonPress(_ sender: AnyObject?) {
//        self.evo_drawerController?.toggleDrawerSide(.right, animated: true, completion: nil)
        let newMsgVC: TLNewMsgVC = TLNewMsgVC()
        self.present(newMsgVC, animated: true, completion: nil)
    }
}
