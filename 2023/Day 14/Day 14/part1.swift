
import Foundation

func totalLoad(content: String){
    var load = 0
    let lines = content.split(separator: "\n")
    var matrix: [[Character]] = []
    
    for j in 0..<lines[0].count{
        var row = [Character]()
        for line in lines{
            row.append(line[line.index(line.startIndex, offsetBy: j)])
        }
        matrix.insert(row, at: 0)
    }
    var matrixCopy = [[Character]]()
    for line in matrix{
        var copy = line
        var freeSpace = [Int]()
        for charIndex in 0..<copy.count{
            if copy[charIndex] == "."{
                freeSpace.append(charIndex)
            }
            if copy[charIndex] == "O" && !freeSpace.isEmpty{
                copy[freeSpace.first!] = "O"
                copy[charIndex] = "."
                freeSpace.remove(at: 0)
                freeSpace.append(charIndex)
            }
            if copy[charIndex] == "#"{
                while !freeSpace.isEmpty && charIndex > freeSpace.first! {
                    freeSpace.remove(at: 0)
                }
            }
        }
        matrixCopy.append(copy)
    }

    for line in matrixCopy{
        for charIndex in 0..<line.count{
            if line[charIndex] == "O"{
                load += (line.count - charIndex)
            }
        }
    }
    print(load)
}
