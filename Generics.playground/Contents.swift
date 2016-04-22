//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Tree <T> {
    
    // 'T' can now be used as a type inside this class
    
    // 'value' is of type T
    var value : T
    
    // 'children' is an array of Tree objects that have
    // the same type as this one
    private (set) var children : [Tree <T>] = []
    
    // We can initialise this object with a value of type T
    init(value : T) {
        self.value = value
    }
    
    // And we can add a child node to our list of children
    func addChild(value : T) -> Tree <T> {
        let newChild = Tree<T>(value: value)
        children.append(newChild)
        return newChild
    }
}

// Tree of integers
let integerTree = Tree<Int>(value: 5)

// Can add children that contain Ints
integerTree.addChild(10)
integerTree.addChild(5)

// Tree of strings
let stringTree = Tree<String>(value: "Hello")

stringTree.addChild("Yes")
stringTree.addChild("Internets")