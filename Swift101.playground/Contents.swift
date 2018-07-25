//: Playground - noun: a place where people can play

import UIKit
import Foundation

func countFrom(from : Int, to : Int) {
    print(from)
    if from < to {
        countFrom(from: from + 1, to: to)
    }
}

countFrom(from: 1, to: 5)

func reverseString (string: String) -> String {
    if string.isEmpty {
        return ""
    } else {
        return string.substring(from: string.index(before: string.endIndex))+reverseString(string: string.substring(to: string.index(before: string.endIndex)))
    }
}
print(reverseString(string: "Marin Todorov"))

func doWork() -> Bool {
    return arc4random() % 10 > 5
}

func error() {
    print("Fail")
}

func success() {
    print("Success")
}
doWork() ? success() : error()

extension Array {
    func swapElementAtIndex(index: Int) -> (Int) -> Array {
        return { newIndex in
            var result = self
            if index < self.count && newIndex < self.count {
                (result[index], result[newIndex]) = (result[newIndex], result[index])
            }
            return result
        }
    }
    
    var arrayWithElementAtIndexToFront: (Int) -> Array {
        return swapElementAtIndex(index: 0 as Int)
    }
    var arrayWithElementAtIndexToBack: (Int) -> Array {
        return swapElementAtIndex(index: (self.count - 1) as Int)
    }
}

let list = [1, 4, 5, 6, 20, 50]
list.arrayWithElementAtIndexToBack(2) //--> [1, 4, 50, 6, 20, 5]
list.arrayWithElementAtIndexToFront(4) //--> [20, 4, 5, 6, 1, 50]

// additional currying research
func add(a:Int) -> (Int) -> Int {
    return{(b: Int) -> Int in
        return a + b
    }
}
let sum = add(a:2)(3)

// Class code
let numbers = [1, 2, 3, 4, 5]
let modify = numbers.map({
    number -> Int in return number + 3
})

var str = "Hello, playground"

func sumAny(_ anys:Any...) -> Int{
    return anys.map(){
        switch $0{
        case let i as Int:
            return i
        case let s as String where Int(s) != nil:
            return Int(s)! * 2
        case is String:
            return -10
        default: return -2
        }
        }.reduce(0, +)
}

sumAny(1,2.0,"John",3,"8")

var num = "f0"

var string = Int(num)
