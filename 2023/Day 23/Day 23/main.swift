import Foundation

let path = "/Users/sanda/Desktop/AdventOfCode2023/2023/Day 23/input.txt"
let content = try String(contentsOfFile: path)
struct Position:Hashable{
    var x: Int
    var y: Int
}

findLongestPath1(content: content)
findLongestPath(content: content)
