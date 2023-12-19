
import Foundation

func gearSum() throws{
    var sum = 0
    let path = "/Users/sanda/Desktop/AdventOfCode2023/2023/Day 3/input.txt"
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
        for index in 0..<line.count{
            if line[index] == "*"{
                sum += findNumbers(row: matrix.firstIndex(of: line)!, column: index , matrix: matrix)
            }
        }
        
    }
    print("Sum of all of the gear ratios \(sum)")
}

func findNumbers(row: Int , column: Int , matrix: [[Character]]) -> Int{
    var numbers = Set<Int>()
    let positions = [[-1,-1],[0,-1],[1,-1],[1,0],[1,1],[0,1],[-1,1],[-1,0]]
    var product = 1
    for position in positions {
        if isValid(x: row + position[0], y: column + position[1], size: matrix.count) && matrix[row + position[0]][column + position[1]].isNumber {
            var firstIndex = column + position[1]
            while isValid(x: row + position[0], y: firstIndex - 1, size: matrix.count) && matrix[row + position[0]][firstIndex - 1].isNumber{
                firstIndex -= 1
            }
            var lastIndex = firstIndex
            while isValid(x: row + position[0], y: lastIndex + 1, size: matrix.count) && matrix[row + position[0]][lastIndex + 1].isNumber{
                lastIndex += 1
            }
            let number = Int(String(matrix[row + position[0]][firstIndex...lastIndex]))!
            numbers.insert(number)
            
        }
    }
    if numbers.count == 2{
        for element in numbers{
            product = product * element
        }
    }else{
        product -= 1
    }
    return product
}
