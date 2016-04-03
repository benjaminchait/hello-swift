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

var secondCounter = 0
for index in 1 ... 10 {
    secondCounter += 1
}
// Loops 10 times

var countDown = 5
while countDown > 0 {
    countDown -= 1
}
countDown // = 0

var countUp = 0
repeat {
    countUp += 1
} while countUp < 5
countUp // =5

let myNumber = 3
let myString = "My number is \(myNumber)"
// = "My number is 3"

let myOtherString = "My number plus one is \(myNumber + 1)"
// = "My number plus one is 4"

let integerSwitch = 3

switch integerSwitch {
case 0:
    print("It's 0")
case 1:
    print("It's 1")
case 2:
    print("It's 2")
default: // note: default is mandatory if not all cases are covered (or can be covered)
    print("It's something else")
} // Prints "It's something else"

let stringSwitch = "Hello"

switch stringSwitch {
case "Hello":
    print("A greeting")
case "Goodbye":
    print("A farewell")
default:
    print("Something else")
} // Prints "A greeting"

let tupleSwitch = ("Yes", 123)

switch tupleSwitch {
case ("Yes", 123):
    print("Tuple contains 'Yes' and '123'")
case ("Yes", _):
    print("Tuple contains 'Yes' and something else")
case (let string, _):
    print("Tuple contains the string '\(string)' and something else")
default:
    break
} // Prints "Tuple contains 'Yes' and '123'"

var someNumber = 15

switch someNumber {
case 0...10:
    print("Number is between 0 and 10")
case 11...20:
    print("Number is between 10 and 20")
case 21:
    print("Number is 21!")
default:
    print("Number is something else")
} // Prints "Number is between 11 and 20"

let fallthroughSwitch = 10

switch fallthroughSwitch {
case 0..<20:
    print("Number is between 0 and 20")
    fallthrough
case 0..<30:
    print("Number is between 0 and 30")
default:
    print("Number is something else")
} // Prints "Number is between 0 and 20" and then "Number is between 0 and 30"

var myVariable = 123
let myConstantVariable = 123

myVariable += 5
// myConstantVariable += 5 // (ERROR: can't change a constant value)

// Explicit type of integer
let anExplicitInteger : Int = 2

var someVariable : Int
// someVariable += 2 // ERROR: someVariable doesn't have a value, so can't add 2 to it
someVariable = 2
someVariable += 2 // WORKS, because someVariable has a value to add to