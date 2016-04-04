//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

if 1+1 == 2 {
    print("The math checks out")
}
// Prints "The math checks out", which is a relief

/* Control Flow (Loops, Switches) */

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

/* Variables and Constants */

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

var someVariableNote =
"Yes"

someVariableNote = "No"; print(someVariableNote)

/* Operators */

1 + 7 // 8
6 - 5 // 1
4 / 2 // 2
4 * 0 // 0

2 == 2 // true
2 != 2 // false
"yes" == "no" // false
"yes" != "no" // true

true.description // "true"
4.advancedBy(3) // 7

/* Types */

// Int represents a whole number, so 1
// Double represents a decimal number, so 1.2
// String represents a list of charactrs, so "hello world"
// Bool for representing boolean state, so true or false

// Implicit type of integer
var anInteger = 2

// ERROR: can't add a string to an integer
// anInteger += "Yes"

let emptyString = ""

let anotherEmptyString = String()

emptyString.isEmpty // = true

var composingAString = "Hello"
composingAString += ", World!" // = "Hellow, World!"

var reversedString = ""
for character in "Hello".characters {
    reversedString = String(character) + reversedString
}
reversedString // = "olleH"

"Hello".characters.count // = 5

let string1 : String = "Hello"
let string2 : String = "Hel" + "lo"

string1.uppercaseString // = "HELLO"
string2.lowercaseString // = "hello"

if string1 == string2 {
    print("The strings are equal")
}


if string1 as AnyObject === string2 as AnyObject {
    print("The strings are the same object")
}

if string1.hasPrefix("H") {
    print("String begins with an H")
}
if string1.hasSuffix("llo") {
    print("String ends in 'llo'")
}

// Optional integer, allowed to be nil
var anOptionalInteger : Int? = nil
anOptionalInteger = 42

// Nonoptional (regular), NOT allowed to be nil
var aNonOptionalInteger = 42

// aNonOptionalInteger = nil
// ERROR: only optional values can be nil

if anOptionalInteger != nil {
    print("It has a value!")
} else {
    print("It has no value!")
}

// Optinoal types must be unwrapped using !
anOptionalInteger = 2
1 + anOptionalInteger! // = 3

//anOptionalInteger = nil
//1 + anOptionalInteger!
//// CRASH: anOptionalInteger = nil, can't use nil data

var implicitlyUnwrappedOptionalInteger : Int!
implicitlyUnwrappedOptionalInteger = 1
1 + implicitlyUnwrappedOptionalInteger // = 2

var conditionalString : String? = "a string"

if let theString = conditionalString {
    print("The string is '\(theString)'")
} else {
    print("The string is nil")
} // Prints "The string is 'a string'"

//if thing is String {
//    print("Thing is a string!")
//}

//var maybeString = thing as? String

// maybeString is a String? - an optional string
// If the check didn't work, maybeString will be nil.

//var definitelyString = thing as! String
// definitelyString is a String, and is guaranteed to have a value

let aString = String(2)
// = "2"

// ERROR: Can't directly convert between types
//let aString = anInteger

let aTuple = (1, "Yes")

let theNumber = aTuple.0 // = 1

let anotherTuple = (aNumber: 1, aString: "Yes")

let theOtherNumber = anotherTuple.aNumber // = 1

// Array of integers
let arrayOfIntegers : [Int] = [1,2,3]

// Type of array is implied
let implicitArrayOfIntegers = [1,2,3]

// You can also create an empty array, but you must provide the type
let anotherArray = [Int]()

var myArray = [1,2,3]
myArray.append(4)
// = [1,2,3,4]

myArray.insert(5, atIndex: 0)
// = [5,1,2,3,4]

myArray.removeAtIndex(4)
// = [5,1,2,3]

myArray.reverse()
// = [3,2,1,5]

myArray.count
// = 4

let immutableArray = [42,24]

var crew = [
    "Captain": "Benjamin Sisko",
    "First Office": "Kira Nerys",
    "Constable": "Odo"
]

crew["Captain"]
// = "Benjamin Sisko"

crew["Doctor"] = "Julian Bashir"

// This dictinoary uses integers for both keys and values
var aNumberDictionary = [1: 2]
aNumberDictionary[21] = 23

var aMixedDictionary = ["one": 1, "two": "twoooo"]
// the type of this dictionary is [String: NSObject], allowing it to have basically any type of value

// enumeration of top secret future iPads that definitely will never exist
enum FutureiPad {
    case iPadSuperPro
    
    case iPadTotallyPro
    
    case iPadLudicrous
    
}

var nextiPad = FutureiPad.iPadTotallyPro

nextiPad = .iPadSuperPro

switch nextiPad {
case .iPadSuperPro:
    print("Too big!")
case .iPadTotallyPro:
    print("Too small!")
case .iPadLudicrous:
    print("Just right!")
}

enum Weapon {
    case Laser(powerLevel: Int)
    case Missiles(range: Int)
}

let spaceLaser = Weapon.Laser(powerLevel: 5)

switch spaceLaser {
case .Laser(powerLevel: 0...10):
    print("It's a laser with power from 0 to 10!")
case .Laser:
    print("It's a laser!")
case .Missiles(let range):
    print("It's a missile with range \(range)!")
}
// Prints "It's a laser with power from 0 to 10!"

var setOfStrings = Set<String>()

var fruitSet: Set = ["apple", "orange", "orange", "banana"]

fruitSet.count
// = 3

if fruitSet.isEmpty {
    print("My set is empty!")
}

// Add a new item to the set
fruitSet.insert("pear")

// Remove an item from the set
fruitSet.remove("apple")
// mySet now contains {"banana", "pear", "orange"}

for fruit in fruitSet {
    let fruitPlural = fruit + "s"
    print("You know what's tasy? \(fruitPlural.uppercaseString).")
}