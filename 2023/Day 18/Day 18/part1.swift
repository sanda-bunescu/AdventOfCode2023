import Foundation

func nrOfCubicMeters(content: String){
    let lines = content.split(separator: "\n")
    var input = [(Character , Int)]()
    for line in lines{
        let parts = line.split(separator: " ")
        input.append((Character(String(parts[0])) , Int(parts[1])!))
    }
    let edges = getPositions(from: input)
    let minX = edges.reduce(Int.max) { min($0, $1.x) }
    let maxX = edges.reduce(Int.min) { max($0, $1.x) }
    let minY = edges.reduce(Int.max) { min($0, $1.y) }
    let maxY = edges.reduce(Int.min) { max($0, $1.y) }

    var count = 0
    for i in minX...maxX{
        for j in minY...maxY{
            if determinePointLocalization(edges: edges, point: (x: i, y: j)){
                count += 1
            }
        }
    }
    print(count)
}

func getPositions(from input: [(direction: Character, distance: Int)]) -> [(x: Int, y: Int)] {
    var result = [(x: Int, y: Int)]()
    var currentPosition = (x: 0, y: 0)
    result.append(currentPosition)
    for (direction, distance) in input {
        switch direction {
        case "D":
            currentPosition.x += distance
        case "R":
            currentPosition.y += distance
        case "L":
            currentPosition.y -= distance
        case "U":
            currentPosition.x -= distance
        default:
            break
        }
        
        result.append(currentPosition)
    }
    
    return result
}

func determinePointLocalization(edges: [(x: Int, y: Int)] , point: (x: Int, y: Int)) -> Bool{
    var intersections = 0
    for edge in 0..<edges.count - 1{
        var A = (x: Int.min, y: Int.min)
        var B = (x: Int.min, y: Int.min)
        if edges[edge].y == edges[edge + 1].y && edges[edge + 1].y == point.y && (point.x - edges[edge].x)*(point.x - edges[edge + 1].x) <= 0 {
            return true
        }
        if edges[edge].y > edges[edge + 1].y {
            A = edges[edge]
            B = edges[edge + 1]
        }
        if edges[edge].y < edges[edge + 1].y {
            A = edges[edge + 1]
            B = edges[edge]
        }
        if edges[edge].y != edges[edge + 1].y && point.y > B.y && point.y < A.y {
            if determiant(a: A, b: point, c: B) > 0{
                intersections += 1
            }
            if determiant(a: A, b: point, c: B) == 0{
                return true
            }
        }
        if edges[edge].y != edges[edge + 1].y && point.y == A.y {
            if point.x < A.x{
                intersections += 1
            }
            if point.x == A.x{
                return true
            }
        }
        if edges[edge].y != edges[edge + 1].y && point.y == B.y {
            if point.x == B.x{
                return true
            }
        }
    }
    if intersections % 2 == 0{
        return false
    }else{
        return true
    }
}
func determiant(a: (x: Int, y: Int) , b: (x: Int, y: Int) , c: (x: Int, y: Int)) -> Int{
    Int((a.x * b.y) + (a.y * c.x) + (b.x * c.y) - (b.y * c.x) - (a.x * c.y) - (b.x * a.y))
}
