//
//  testrbtreeTests.swift
//  testrbtreeTests
//
//  Created by insomniak on 29/02/2016.
//  Copyright © 2016 ChillCoding. All rights reserved.
//

import XCTest
@testable import testrbtree

class testrbtreeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func print_node<T>(node : RBTreeNode<T>?)
    {
        if (node?.black == true)
        {
            print("black")
        }
        else
        {
            print("red")
        }
        print(node?.key)
    }
    
    func print_fullInfo_node<T>(node : RBTreeNode<T>?)
    {
        print("-----------BEGIN-----------")
        
        if (node != nil)
        {
            print ("Node")
            print_node(node)
        }
        
        if (node?.left != nil)
        {
            print ("Node Left")
            print_node(node?.left)
        }
        
        if (node?.right != nil)
        {
            print ("Node Right")
            print_node(node?.right)
        }
        
        if (node?.parent != nil)
        {
            print ("Node Parent")
            print_node(node?.parent)
        }
        
        print("------------END------------")
    }
    
    func pretty_print_rbTree<T>(node : RBTreeNode<T>?)
    {
        if (node == nil)
        {
            return;
        }
        
        print_fullInfo_node(node)
        pretty_print_rbTree(node!.right)
        pretty_print_rbTree(node!.left)
        

    }
    
    func testExample() {
        
        let root : RBTree<Int> = RBTree.init(value: 13)
        
        root.insert(8)
        root.insert(17)
        root.insert(1)
        root.insert(6)
        root.insert(11)
        root.insert(25)
        root.insert(22)
        root.insert(15)
        root.insert(27)
        root.insert(18)
//        root.insert(517)
//        root.insert(51)
//        root.insert(56)
//        root.insert(551)
//        root.insert(55)
//        root.insert(552)
//        root.insert(55)
//        root.insert(57)
        pretty_print_rbTree(root.root)
        pretty_print_rbTree(root.root)

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
