import Foundation

func energizedTiles(content: String){
    var matrix = [[Character]]()
    let lines = content.split(separator: "\n")
    for line in lines{
        var array = [Character]()
        for char in line{
            array.append(char)
        }
        matrix.append(array)
    }
    var position = [(0 , 0 , "right")]
    struct IntPair: Hashable {
        var first: Int
        var second: Int
        var dir: String
    }
    
    var energized = Set<IntPair>()
    
    while !position.isEmpty {
        
        position = position.filter{
            ($0.0 >= 0 && $0.0 < matrix.count) && ($0.1 >= 0 && $0.1 < matrix.count) && !energized.contains(IntPair(first: $0.0, second: $0.1, dir: $0.2))
        }
        if !position.isEmpty{
            
            if matrix[position.first!.0][position.first!.1] == "."{
                
                if !energized.contains(where: {$0.first == position.first!.0 && $0.second == position.first!.1}){
                    energized.insert(IntPair(first: position.first!.0,second: position.first!.1 , dir: position.first!.2))
                }
                if position.first!.2 == "right"{
                    position[0].1 += 1
                }
                if position.first!.2 == "left"{
                    position[0].1 -= 1
                }
                if position.first!.2 == "down"{
                    position[0].0 += 1
                }
                if position.first!.2 == "up"{
                    position[0].0 -= 1
                }
                continue
            }
            if matrix[position.first!.0][position.first!.1] == "\\"{
                if !energized.contains(where: {$0.first == position.first!.0 && $0.second == position.first!.1}){
                    energized.insert(IntPair(first: position.first!.0,second: position.first!.1 , dir: position.first!.2))
                }
                if position.first!.2 == "right"{
                    position[0].2 = "down"
                    position[0].0 += 1
                }else if position.first!.2 == "left"{
                    position[0].2 = "up"
                    position[0].0 -= 1
                }else if position.first!.2 == "down"{
                    position[0].2 = "right"
                    position[0].1 += 1
                }else if position.first!.2 == "up"{
                    position[0].2 = "left"
                    position[0].1 -= 1
                }
                continue
            }
            if matrix[position.first!.0][position.first!.1] == "/"{
                if !energized.contains(where: {$0.first == position.first!.0 && $0.second == position.first!.1}){
                    energized.insert(IntPair(first: position.first!.0,second: position.first!.1 , dir: position.first!.2))
                }
                if position.first!.2 == "right"{
                    position[0].2 = "up"
                    position[0].0 -= 1
                }else if position.first!.2 == "left"{
                    position[0].2 = "down"
                    position[0].0 += 1
                }else if position.first!.2 == "down"{
                    position[0].2 = "left"
                    position[0].1 -= 1
                }else if position.first!.2 == "up"{
                    position[0].2 = "right"
                    position[0].1 += 1
                }
                continue
            }
            if matrix[position.first!.0][position.first!.1] == "-"{
                if !energized.contains(where: {$0.first == position.first!.0 && $0.second == position.first!.1}){
                    energized.insert(IntPair(first: position.first!.0,second: position.first!.1 , dir: position.first!.2))
                }
                if position.first!.2 == "right"{
                    position[0].1 += 1
                }
                if position.first!.2 == "left"{
                    position[0].1 -= 1
                }
                if position.first!.2 == "up" || position.first!.2 == "down"{
                    let currentPosition = position[0]
                    position.removeFirst()
                    position.append((currentPosition.0 , currentPosition.1 - 1 , "left"))
                    position.append((currentPosition.0 , currentPosition.1 + 1 , "right"))
                }
                continue
                
            }
            if matrix[position.first!.0][position.first!.1] == "|"{
                if !energized.contains(where: {$0.first == position.first!.0 && $0.second == position.first!.1}){
                    energized.insert(IntPair(first: position.first!.0,second: position.first!.1 , dir: position.first!.2))
                }
                if position.first!.2 == "down"{
                    position[0].0 += 1
                }
                if position.first!.2 == "up"{
                    position[0].0 -= 1
                }
                if position.first!.2 == "right" || position.first!.2 == "left"{
                    let currentPosition = position[0]
                    position.removeFirst()
                    position.append((currentPosition.0 - 1 , currentPosition.1 , "up"))
                    position.append((currentPosition.0 + 1 , currentPosition.1 , "down"))
                }
                
            }
        }
    }
    print("Energized tiles: \(energized.count)")
    
    
}
