import Foundation

func findShortestPaths(content: [[String]]){
    var matrix = content
    //modify the matrix
    var index = 0
    for line in matrix{
        if line.allSatisfy({$0 == "."}){
            matrix.insert(line, at: index)
            index += 1
        }
        index += 1
    }
    var columnIndex = [Int]()
    for i in 0..<matrix[0].count{
        var isHashtag = false
        for j in 0..<matrix.count{
            if matrix[j][i] == "#"{
                isHashtag = true
                break
            }
        }
        if isHashtag == false{
            
            columnIndex.append(i)
        }
    }
    for i in 0..<matrix.count{
        for index in columnIndex.reversed(){
            matrix[i].insert(".", at: index)
        }
    }
    //find paths
    var sum = 0
    for i in 0..<matrix.count{
        for j in 0..<matrix[i].count{
            if matrix[i][j] != "."{
                for tmpi in i..<matrix.count{
                    for tmpj in 0..<matrix[i].count{
                        var path = 0
                        if matrix[tmpi][tmpj] != "." && (tmpi == i && tmpj > j || tmpi > i){
                            path = abs(i - tmpi) + abs(j - tmpj)
                            sum += path
                        }
                    }
                }
            }
        }
    }
    print("Part 1: \(sum)")
}
