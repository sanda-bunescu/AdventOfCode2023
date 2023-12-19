//
//  totalWinngs.swift
//  Day 7
//
//  Created by Sanda Bunescu on 07.12.2023.
//

import Foundation

var types = Array(repeating: [String](), count: 7)
let sortingArray = ["A","K","Q","J","T","9","8","7","6","5","4","3","2"]
func totalWinnings(){
    let path = "/Users/sanda/Desktop/AdventOfCode2023/2023/Day 7/input.txt"
    let content = try! String(contentsOfFile: path)
    let contentArray = content.split(separator: "\n")
    var dictionary = [String : Int]()
    for value in contentArray{
        let tmp = value.split(separator: " ")
        dictionary[String(tmp[0])] = Int(tmp[1])!
    }
    for key in dictionary.keys{
        check(hand: key)
    }
    sortTypes()
    var finalArray = [(_:String , _:Int)]()
    for array in types{
        for string in array{
            finalArray.append((string , dictionary[string]!))
        }
    }
    var total = 0
    for index in 0..<finalArray.count{
        total += (index + 1) * finalArray[index].1
    }
    print(total)
    
}
func sortTypes(){
    for index in 0..<types.count{
        types[index].sort { hand1 , hand2 in
            for (char1, char2) in zip(hand1, hand2) {
                if sortingArray.firstIndex(of: String(char1))! > sortingArray.firstIndex(of: String(char2))! {
                    return true
                }
                if sortingArray.firstIndex(of: String(char1))! < sortingArray.firstIndex(of: String(char2))! {
                    return false
                }
            }
            return false
        }
    }
}



func check(hand: String){
    var dict = [Character : Int]()
    for char in hand{
        dict[char , default: 0] += 1
    }
    let array = dict.sorted{$0.value > $1.value}
    
    if array[0].value == 5{
        types[6].append(hand)
        return
    }
    if array[0].value == 4{
        types[5].append(hand)
        return
    }
    if array[0].value == 3 && array[1].value == 2{
        types[4].append(hand)
        return
    }
    if array[0].value == 3{
        types[3].append(hand)
        return
    }
    if array[0].value == 2 && array[1].value == 2{
        types[2].append(hand)
        return
    }
    if array[0].value == 2{
        types[1].append(hand)
        return
    }
    if array[0].value == 1{
        types[0].append(hand)
        return
    }
}
