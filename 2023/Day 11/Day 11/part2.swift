import Foundation

func findShortestPaths2(content: [[String]]){
    var matrix = content
    var rowIndex = [Int]()
    for line in 0..<matrix.count{
        if matrix[line].allSatisfy({$0 == "."}){
            rowIndex.append(line)
        }
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
    var sum = 0
    for i in 0..<matrix.count{
        for j in 0..<matrix[i].count{
            if matrix[i][j] != "."{
                for tmpi in i..<matrix.count{
                    for tmpj in 0..<matrix[i].count{
                        var path = 0
                        if matrix[tmpi][tmpj] != "." && (tmpi == i && tmpj > j || tmpi > i){
                            var rowsToAdd = 0
                            var columnsToAdd = 0
                            for row in rowIndex{
                                if i < row && row < tmpi{
                                    rowsToAdd += 1000000 - 1
                                }
                            }
                            for column in columnIndex{
                                if (j < column && column < tmpj) || j > column && column > tmpj{
                                    columnsToAdd += 1000000 - 1
                                }
                            }
                            if j > tmpj{
                                path = abs(i - (tmpi + rowsToAdd)) + abs((j + columnsToAdd) - tmpj)
                                
                            }else{
                                path = abs(i - (tmpi + rowsToAdd)) + abs(j - (tmpj + columnsToAdd))
                            }
                            sum += path
                        }
                    }
                }
            }
        }
    }
    print("Part 2: \(sum)")
    
}
