import Foundation
let directions:[(x:Int , y:Int)] = [(x:0,y:1),(x:0,y:-1),(x:1,y:0),(x:-1,y:0)]

func findLongestPath(content: String){
    var matrix = [[Character]]()
    let lines = content.split(separator: "\n")
    for line in lines {
        var row = [Character]()
        for char in line{
            row.append(char)
        }
        matrix.append(row)
    }
    
    var startPosition = Position(x: 0, y: matrix[0].firstIndex(of: ".")!)
    let visited = Set<Position>()
    print(findPath(visited: visited, position: &startPosition,matrix: matrix))
}

func findPath(visited: Set<Position> , position: inout Position , matrix: [[Character]]) -> Int{
    let endPosition = Position(x: matrix.count - 1, y: matrix[matrix.count - 1].firstIndex(of: ".")!)
    var tmpVisited = visited
    var length = 1
    while true{
        var counter = 0
        var childPositions = [(x: Int , y: Int)]()
        for direction in directions{
            if isValid(x: position.x + direction.x, y: position.y + direction.y , matrix: matrix) && matrix[position.x + direction.x][position.y + direction.y] != "#" && !tmpVisited.contains(Position(x: position.x + direction.x, y: position.y + direction.y)){
                
                counter += 1
                childPositions.append((x: position.x + direction.x, y:position.y + direction.y))
            }
        }
        tmpVisited.insert(position)
        if counter == 1{
            length += 1
            position.x = childPositions.first!.x
            position.y = childPositions.first!.y
        }
        if counter > 1{
            var maxLength = -1
            for childPosition in childPositions {
                var child = Position(x: childPosition.x, y: childPosition.y)
                let tmpLength = findPath(visited: tmpVisited, position: &child,matrix: matrix)
                if tmpLength > maxLength{
                    maxLength = tmpLength
                }
            }
            return length + maxLength
        }
        if counter == 0 {
            if position == endPosition{
                return length - 1
            }else{
                return -1
            }
        }
        
    }
}

func isValid(x: Int , y: Int, matrix: [[Character]]) -> Bool{
    (x >= 0 && x < matrix.count) && (y >= 0 && y < matrix.count)
}
