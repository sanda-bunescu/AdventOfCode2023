import Foundation

func findLenghtPath(){
    let inputPath = "/Users/sanda/Desktop/AdventOfCode2023/2023/Day 8/input.txt"
    let content = try! String(contentsOfFile: inputPath)
    let directions = content.split(separator: "\n\n")[0]
    let paths = content.split(separator: "\n\n")[1].split(separator: "\n")
    var dictionaryPath = [String: [String]]()
    for path in paths{
        let parts = path.split(separator: " = ")
        let base = parts[0]
        let RLDirection = parts[1].replacing("(", with: "").replacing(")", with: "").split(separator: ", ")
        dictionaryPath[String(base)] = [String(RLDirection[0]),String(RLDirection[1])]
    }
    var currentKey = "AAA"
    var moves = 0
    var finalMoves = 0
    while currentKey != "ZZZ"{
        (moves,currentKey) = findPath(paths: dictionaryPath, directions: String(directions), current: currentKey)
        finalMoves += moves
    }
    print(finalMoves)
}

func findPath(paths: [String: [String]] , directions: String , current: String) -> (Int , String){
    var currentKey = current
    var moves = 0
    for direction in directions{
        if direction == "R"{
            currentKey = paths[currentKey]![1]
            moves += 1
        }
        if direction == "L"{
            currentKey = paths[currentKey]![0]
            moves += 1
        }
        
        
    }
    return (moves,currentKey)
    
}
