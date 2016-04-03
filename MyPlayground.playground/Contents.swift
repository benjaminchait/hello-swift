//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

if 1+1 == 2 {
    print("The math checks out")
}
// Prints "The math checks out", which is a relief

let loopingArray = [1,2,3,4,5]
var loopSum = 0
for number in loopingArray {
    loopSum += number
}
loopSum // = 15

var firstCounter = 0
for index in 1 ..< 10 {
    firstCounter += 1
}
// Loops 9 times