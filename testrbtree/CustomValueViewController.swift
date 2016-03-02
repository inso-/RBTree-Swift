//
//  CustomValueViewController.swift
//  testrbtree
//
//  Created by insomniak on 02/03/2016.
//  Copyright © 2016 ChillCoding. All rights reserved.
//

import UIKit

class CustomValueViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
     var textField: UITextField!
    var data : Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier : String = ""
        if (indexPath.row == self.data.count  || self.data.count == 0)
        {
             cellIdentifier = "AddCell"
        }
        else
        {
            cellIdentifier = "ValueCell"
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        if (indexPath.row == self.data.count || self.data.count == 0)
        {
            let add :  AddCell = cell as! AddCell
            self.textField = add.textField
        }
        else
        {
            cell.textLabel!.text = String(self.data[indexPath.row])
        }
        
        return cell
    }

    @IBAction func addValue(sender: AnyObject) {
        self.data.append(self.textField.text!)
        self.tableView.reloadData()
        self.textField.endEditing(true)
    }
    @IBAction func generateTree(sender: AnyObject) {
    }

    override func viewDidLayoutSubviews() {
        //        self.scrollView.contentSize = CGSizeMake(1000, 1000)
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let tree : RBTree<Int> = RBTree<Int>(value: Int(self.data[0] as! String)!)
        
        var i : Int = 0
        while i + 1 < self.data.count
        {
            ++i
            tree.insert(Int(self.data[i] as! String)!)
        }

        (segue.destinationViewController as! ViewController).tree = tree
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    
    /*
    // MARK: - Navigation


    */

}
