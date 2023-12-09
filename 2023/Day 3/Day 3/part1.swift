//
//  part1.swift
//  Challange3
//
//  Created by Sanda Bunescu on 04.12.2023.
//

import Foundation

func partNumbersSum() throws{
    var sum = 0
    let path = "/Users/sanda/Desktop/AdventOfCode/Day 3/input.txt"
    let content = try String(contentsOfFile: path)
    let lines = content.split(separator: "\n")
    var matrix:[[Character]] = []
    for line in lines{
        var row = [Character]()
        for i in 0..<line.count{
            row.append(line[line.index(line.startIndex, offsetBy: i)])
        }
        matrix.append(row)
    }
    
    for line in matrix{
        var firstIndex = -1
        var lastIndex = -1
        var number = 0
        for index in 0..<line.count{
            if line[index].isNumber{
                if firstIndex == -1{
                    firstIndex = index
                }
                if (index + 1 < line.count && !line[index + 1].isNumber) || index + 1 == line.count{
                    lastIndex = index
                }
                if firstIndex != -1 && lastIndex != -1{
                    for i in firstIndex...lastIndex{
                        number = number * 10 + Int(String(line[i]))!
                    }
                    if verify(firstIndex: firstIndex, lastIndex: lastIndex, matrix: matrix , line: matrix.firstIndex(of: line)!){
                        sum += number
                    }
                    number = 0
                    firstIndex = -1
                    lastIndex = -1
                }
            }
            
        }
    }
    print("Sum of all the part numbers: \(sum)")
}

func verify(firstIndex: Int , lastIndex: Int , matrix: [[Character]] , line: Int) -> Bool{
    let modifications = [[-1,-1],[0,-1],[1,-1],[1,0],[1,1],[0,1],[-1,1],[-1,0]]
    
    for numberColumn in firstIndex...lastIndex{
        for modification in modifications {
            if isValid(x: line + modification[0], y: numberColumn + modification[1], size: matrix.count) && !matrix[line + modification[0]][numberColumn + modification[1]].isNumber && matrix[line + modification[0]][numberColumn + modification[1]] != "."{
                return true
            }
        }
    }
    
    
    return false
}

func isValid(x: Int , y: Int , size: Int) -> Bool{
    (x >= 0 && y >= 0) && (x < size && y < size)
}
