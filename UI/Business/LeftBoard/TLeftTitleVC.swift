//
//  TLeftTitleVC.swift
//  todolist
//
//  Created by yht on 03/11/2016.
//  Copyright © 2016 yht. All rights reserved.
//

import UIKit

class TLeftTitleVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var leftTitle: TLeftTitle?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        leftTitle = TLeftTitle()
        
        var nib = UINib(nibName: "TLLeftTitleCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TLLeftTitleCell")
        
        nib = UINib(nibName: "TLAccountCell", bundle:nil)
        tableView.register(nib, forCellReuseIdentifier: "TLAccountCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((leftTitle?.titles?.count)! + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: TLAccountCell? = tableView.dequeueReusableCell(withIdentifier:  "TLAccountCell") as! TLAccountCell?
            return cell!
            
        }else {
            let cell: TLLeftTitleCell? = tableView.dequeueReusableCell(withIdentifier:  "TLLeftTitleCell") as! TLLeftTitleCell?
            
            let item = leftTitle?.titles?[indexPath.row - 1]
            TLLeftTitleCell.setupCell(cell: cell, item: item)
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 142
        }else {
            return 42
        }
    }
}
