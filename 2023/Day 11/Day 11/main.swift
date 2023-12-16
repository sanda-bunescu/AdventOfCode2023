import Foundation
let inputPath = "/Users/sanda/Desktop/AdventOfCode2023/2023/Day 11/input.txt"
let content = try! String(contentsOfFile: inputPath)

let lines = content.split(separator: "\n")

var matrix = [[String]]()
for i in 0..<lines.count{
    var row = [String]()
    for j in 0..<lines[i].count{
        row.append(String(lines[i][lines[i].index(lines[i].startIndex, offsetBy: j)]))
    }
    matrix.append(row)
}

findShortestPaths(content: matrix)
findShortestPaths2(content: matrix)

