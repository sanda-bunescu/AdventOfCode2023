import Foundation
struct element{
    var x : Int
    var y : Int
}
func findLongestPath(content: String){
    let lines = content.split(separator: "\n")
    var map = [[String]]()
    var startPosition = (x: -1 , y: -1)
    for index in 0..<lines.count{
        let characters = Array(lines[index])
        let stringArray = characters.map { String($0) }
          map.append(stringArray)
        if characters.contains("S"){
            startPosition = (x: index, y: characters.firstIndex(of: "S")!)
        }
    }
    
    
    var visited = [( _: element, index: Int)]()
    var toVisit = [(element(x: startPosition.x, y: startPosition.y),0)]
    var longestPath = 0
    while !toVisit.isEmpty{
        let current = toVisit.first!
        let index = current.1
        let elementToProcess = current.0
        if elementToProcess.x - 1 >= 0 && elementToProcess.x - 1 < map.count && elementToProcess.y >= 0 && elementToProcess.y < map.count{
            if map[elementToProcess.x - 1][elementToProcess.y] == "|" || map[elementToProcess.x - 1][elementToProcess.y] == "7" || map[elementToProcess.x - 1][elementToProcess.y] == "F"{
                map[elementToProcess.x - 1][elementToProcess.y] = String(index + 1)
                toVisit.append((element(x: elementToProcess.x - 1, y: elementToProcess.y),index + 1))
                longestPath = index + 1
            }
            
        }
        if elementToProcess.x >= 0 && elementToProcess.x < map.count && elementToProcess.y - 1 >= 0 && elementToProcess.y - 1 < map.count{
            if map[elementToProcess.x][elementToProcess.y - 1] == "-" || map[elementToProcess.x][elementToProcess.y - 1] == "L" || map[elementToProcess.x][elementToProcess.y - 1] == "F"{
                map[elementToProcess.x][elementToProcess.y - 1] = String(index + 1)
                toVisit.append((element(x: elementToProcess.x, y: elementToProcess.y - 1),index + 1))
                longestPath = index + 1
            }
            
        }
        if elementToProcess.x + 1 >= 0 && elementToProcess.x + 1 < map.count && elementToProcess.y >= 0 && elementToProcess.y < map.count{
            if map[elementToProcess.x + 1][elementToProcess.y] == "|" || map[elementToProcess.x + 1][elementToProcess.y] == "J" || map[elementToProcess.x + 1][elementToProcess.y] == "L"{
                map[elementToProcess.x + 1][elementToProcess.y] = String(index + 1)
                toVisit.append((element(x: elementToProcess.x + 1, y: elementToProcess.y),index + 1))
                longestPath = index + 1
            }
            
        }
        if elementToProcess.x >= 0 && elementToProcess.x < map.count && elementToProcess.y + 1 >= 0 && elementToProcess.y + 1 < map.count{
            if map[elementToProcess.x][elementToProcess.y + 1] == "-" || map[elementToProcess.x][elementToProcess.y + 1] == "7" || map[elementToProcess.x][elementToProcess.y + 1] == "J"{
                map[elementToProcess.x][elementToProcess.y + 1] = String(index + 1)
                toVisit.append((element(x: elementToProcess.x, y: elementToProcess.y + 1),index + 1))
                longestPath = index + 1
            }
            
        }
        visited.append(toVisit.first!)
        toVisit.removeFirst()
    }
    print(longestPath)
    
}

