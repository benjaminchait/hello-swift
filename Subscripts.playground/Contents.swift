//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Extend the unsigned 8-bit integer type
extension UInt8 {
    
    // Allow subscripting this type using UInt8s;
    subscript(bit: UInt8) -> UInt8 {
        
        // This is run when you do things like "value[x]"
        get {
            return (self >> bit & 0x07) & 1
        }
        
        // This is run when you do things like "value[x] = y"
        set {
            let cleanBit = bit & 0x07
            let mask = 0xFF ^ (1 << cleanBit)
            let shiftedBit = (newValue & 1) << cleanBit
            self = self & mask | shiftedBit
        }
    }
}

var byte : UInt8 = 212
byte[0] // 0
byte[2] // 1
byte[5] // 0
byte[6] // 1

// Change the last bit
byte[7] = 0

// The number is now changed!
byte // = 84
