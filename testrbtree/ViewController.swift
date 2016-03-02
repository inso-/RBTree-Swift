//
//  ViewController.swift
//  testrbtree
//
//  Created by insomniak on 29/02/2016.
//  Copyright © 2016 ChillCoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController , PSTreeGraphDelegate {
    var tree : RBTree<Int>!
    
    @IBOutlet weak var treeGraphView: PSBaseTreeGraphView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = CGSizeMake(10000, 10000)
        self.treeGraphView.delegate = self
        self.treeGraphView.nodeViewNibName = "RBTreeNodeView";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.treeGraphView.treeGraphOrientation = PSTreeGraphOrientationStyle.Horizontal
        if tree == nil
        {
            self.tree  = RBTree.init(value: 13)
            tree.insert(8)
            tree.insert(17)
            tree.insert(1)
            tree.insert(6)
            tree.insert(11)
            tree.insert(25)
            tree.insert(22)
            tree.insert(15)
            tree.insert(27)
            tree.insert(18)
            tree.insert(8)
            tree.insert(17)
            tree.insert(1)
            tree.insert(6)
            tree.insert(11)
            tree.insert(25)
            tree.insert(22)
            tree.insert(15)
            tree.insert(27)
            tree.insert(18)
            tree.insert(8)
            tree.insert(17)
            tree.insert(1)
            tree.insert(6)
            tree.insert(11)
            tree.insert(25)
            tree.insert(22)
            tree.insert(15)
            tree.insert(27)
            tree.insert(18)
        }
        self.treeGraphView.modelRoot = tree.root
        }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        

        self.treeGraphView.parentClipViewDidResize(nil)
    }

    
    typealias Element = Int
    
    @objc func configureNodeView(nodeView: UIView!, withModelNode modelNode: PSTreeGraphModelNode!) {
        
        let leaf : MyLeafView = nodeView as! MyLeafView
        let lol : AnyObject = modelNode
        let node : RBTreeNode<Element> = lol as! RBTreeNode<Element>
        leaf.value.text = String(node.key)
        
        if (node.black)
        {
            leaf.color.text = "black"
            leaf.backgroundColor = UIColor.blackColor()
            leaf.fillColor = UIColor.blackColor()
            leaf.selectionColor = UIColor.blackColor()
        }
        else
        {
            leaf.color.text = "red"
            leaf.backgroundColor = UIColor.redColor()
            leaf.fillColor = UIColor.redColor()
            leaf.selectionColor = UIColor.redColor()
        }
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.treeGraphView .parentClipViewDidResize(nil)
    }
    
    
}

