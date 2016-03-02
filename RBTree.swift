//
//  RBTree.swift
//  testrbtree
//
//  Created by insomniak on 29/02/2016.
//  Copyright © 2016 ChillCoding. All rights reserved.
//

// RBtreeNode class

public class RBTreeNode<T : Comparable> : NSObject , PSTreeGraphModelNode, NSCopying {
    typealias Element = T
    var key: T?
    var left:  RBTreeNode<Element>?
    var right:  RBTreeNode<Element>?
    var parent :  RBTreeNode<Element>?
    var black : Bool
    
    private init(value: T, black: Bool) {
        self.parent = nil
        self.left = nil
        self.right = nil
        self.key = value
        self.black = black
    }
    
    convenience init(value: Element) {
        self.init(value: value, black: true)
    }
    
    // NSCopying
    
    public func copyWithZone(zone: NSZone) -> AnyObject {
        return self
    }
    
    // PSTreeGraphModelNode just to make graph drawable
    
    public func childModelNodes() -> [AnyObject]! {
        
        var res : Array<RBTreeNode<Element>> = []
        
        print(self.parent)
        
        if (self.left != nil)
        {
            res.append(self.left!)
        }
        if (self.right != nil)
        {
            res.append(self.right!)
        }
        return res
    }
    
    public func parentModelNode() -> PSTreeGraphModelNode! {
        return self.parent
    }
    
}

// Comparable Generics operator

public func ==<T>(left: RBTreeNode<T>, right:RBTreeNode<T>) -> Bool
{
    return left.key == right.key
}

public func ><T>(left: RBTreeNode<T>, right:RBTreeNode<T>) -> Bool
{
    return left.key > right.key
}

public func <<T>(left: RBTreeNode<T>, right:RBTreeNode<T>) -> Bool
{
    return left.key < right.key
}

// RBTree Class

public class RBTree<T : Comparable> : NSObject{
    typealias Element = T
    var size : Int
    
    var root : RBTreeNode<Element>?
    
    convenience init(value : Element)
    {
        self.init(node: RBTreeNode.init(value: value))
    }
    
    init(node : RBTreeNode<Element>)
    {
        self.root = node
        self.size = 1
    }
    
    // insert new node
    
    private func insert_helper(node: RBTreeNode<Element>)
    {
        var yTmpNode : RBTreeNode = self.root!
        var xTmpNode : RBTreeNode? = self.root!.left
        
        while (xTmpNode != nil)
        {
            yTmpNode = xTmpNode!
            if (yTmpNode > node)
            {
                xTmpNode = xTmpNode?.left
            }
            else
            {
                xTmpNode = xTmpNode?.right
            }
        }
        node.parent = yTmpNode
        
        if (yTmpNode === self.root || yTmpNode > node)
        {
            yTmpNode.left = node
        }
        else
        {
            yTmpNode.right = node
        }
        self.size += 1
    }
    
    // insert node and balance tree
    
    func insert(value : Element)
    {
        let node : RBTreeNode = RBTreeNode.init(value: value, black: false)
        var yTmpNode : RBTreeNode<Element>?
        var xTmpNode : RBTreeNode<Element>?
        
        self.insert_helper(node)
        xTmpNode = node
        while (xTmpNode!.parent?.black == false)
        {
            if (xTmpNode!.parent === xTmpNode!.parent?.parent?.left)
            {
                yTmpNode = xTmpNode!.parent?.parent?.right
                if (yTmpNode?.black == false)
                {
                    xTmpNode!.parent?.black = true
                    yTmpNode?.black = true
                    xTmpNode!.parent?.parent?.black = false
                    xTmpNode = xTmpNode?.parent?.parent
                }
                else
                {
                    if (xTmpNode === xTmpNode?.parent?.right)
                    {
                        xTmpNode = xTmpNode?.parent
                        left_rotate(xTmpNode!)
                    }
                    xTmpNode?.parent?.black = true
                    xTmpNode?.parent?.parent?.black = false
                    right_rotate((xTmpNode?.parent?.parent)!)
                }
            }
            else
            {
                yTmpNode = xTmpNode?.parent?.parent?.left
                if (yTmpNode?.black == false)
                {
                        xTmpNode!.parent?.black = true
                        yTmpNode?.black = true
                        xTmpNode!.parent?.parent?.black = false
                        xTmpNode = xTmpNode?.parent?.parent
                }
                else
                {
                    if (xTmpNode === xTmpNode?.parent?.left)
                    {
                        xTmpNode = xTmpNode?.parent
                        right_rotate(xTmpNode!)
                    }
                    xTmpNode?.parent?.black = true
                    xTmpNode?.parent?.parent?.black = false
                    left_rotate((xTmpNode?.parent?.parent)!)
                }
            }
        }
        self.root?.left?.black = true
    }
    
    //left_rotate
    
    private func left_rotate(node : RBTreeNode<Element>)
    {
        let yTmpNode : RBTreeNode<Element>? = node.right
        node.right = yTmpNode?.left
        
        if (yTmpNode?.left != nil)
        {
            yTmpNode?.left?.parent = node
        }
        
        yTmpNode?.parent = node.parent
        
        if (node === node.parent?.left)
        {
            node.parent?.left = yTmpNode
        }
        else
        {
            node.parent?.right = yTmpNode
        }
        yTmpNode?.left = node
        node.parent = yTmpNode
    }
    
    // right rotate
    
    private func right_rotate(node : RBTreeNode<Element>)
    {
        let xTmpNode : RBTreeNode<Element>? = node.left
        node.left = xTmpNode?.right
        
        if (xTmpNode != nil)
        {
            xTmpNode?.right?.parent = node
        }
        
        xTmpNode?.parent = node.parent
        
        if (node === node.parent?.left)
        {
            node.parent?.left = xTmpNode
        }
        else
        {
            node.parent?.right = xTmpNode
        }
        xTmpNode?.right = node
        node.parent = xTmpNode
    }
}
