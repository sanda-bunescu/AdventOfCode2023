import Foundation

func sumarize(content: String){
    let patterns = content.split(separator: "\n\n")
    var sum = 0
    for pattern in patterns{
        
        let horizontalReflection = findHorizontalReflection(pattern: String(pattern))
        if horizontalReflection != -1{
            sum += (horizontalReflection + 1) * 100
        }
        let verticalReflection = findVerticalReflection(pattern: String(pattern))
        if verticalReflection != -1{
            sum += verticalReflection + 1
        }
        
    }
    print(sum)
}

func findHorizontalReflection(pattern: String) -> Int{
    var matrix = [[Character]]()
    let lines = pattern.split(separator: "\n")
    for line in lines{
        let row = line.split(separator: "").map{ $0.first! }
        matrix.append(row)
    }
    return findReflection(matrix: matrix)
}

func findVerticalReflection(pattern: String) -> Int{
    var matrix = [[Character]]()
    let lines = pattern.split(separator: "\n")
    var index = 0
    for _ in 0..<lines[0].count{
        var column = [Character]()
        for line in lines{
            column.append(line[line.index(line.startIndex, offsetBy: index)])
        }
        matrix.append(column)
        index += 1
    }
    return findReflection(matrix: matrix)
}

func findReflection(matrix: [[Character]]) -> Int{
    
    for line in 0..<(matrix.count - 1){
        var distance = 0
        var isReflected = false
        while line + 1 + distance < matrix.count && line - distance >= 0{
            if matrix[line + 1 + distance].elementsEqual(matrix[line - distance]){
                isReflected = true
                distance += 1
            }else{
                break
            }
        }
        if (line + 1 + distance == matrix.count || line - distance == -1) && isReflected{
            return line
        }
    }
    return -1
}
