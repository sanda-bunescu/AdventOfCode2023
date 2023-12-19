import Foundation

func findLenghtPaths(){
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
    var currentkeys = [String]()
    var finalKeys = [String]()
    
    for key in dictionaryPath.keys{
        if key[key.index(key.startIndex, offsetBy: 2)] == "A"{
            currentkeys.append(key)
        }
        if key[key.index(key.startIndex, offsetBy: 2)] == "Z"{
            finalKeys.append(key)
        }
    }
    var movesArray = [Int]()
    for currentkey in currentkeys {
        var tmp = currentkey
        var moves = 0
        var finalMoves = 0
        while tmp[tmp.index(tmp.startIndex, offsetBy: 2)] != "Z"{
            (moves,tmp) = findPath(paths: dictionaryPath, directions: String(directions), current: tmp)
            finalMoves += moves
        }
        movesArray.append(finalMoves)
        
    }
    
    print(lcm(moves: movesArray))
    
}
func lcm(moves: [Int]) -> Int {
   return moves.reduce(1, lcm)
}


func gcd(_ a: Int, _ b: Int) -> Int {
   var a = a
   var b = b
   while b != 0 {
       let temp = b
       b = a % b
       a = temp
   }
   return a
}

func lcm(_ a: Int, _ b: Int) -> Int {
   return a * b / gcd(a, b)
}
