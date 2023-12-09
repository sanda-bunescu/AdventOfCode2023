import Foundation

let inputPath = "/Users/sanda/Desktop/AdventOfCode/Day 9/input.txt"
let content = try! String(contentsOfFile: inputPath)

func convert(content: String) -> [[Int]]{
    var lines = [[Int]]()
    
    for line in content.split(separator: "\n"){
        let numbers = line.split(separator: " ")
        let numberArray = numbers.map{ Int($0)! }
        lines.append(numberArray)
    }
    return lines
}


lastElementsSum(content: content)
firstElementsSum(content: content)
