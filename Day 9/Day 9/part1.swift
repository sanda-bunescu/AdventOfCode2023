import Foundation

func lastElementsSum(content: String){
    let lines = convert(content: content)
    var sum = 0
    for line in lines{
        var copy = line
        var lastElements = [Int]()
        lastElements.append(line.last!)
        while !copy.allSatisfy({ $0 == 0 }){
            for index in 0..<copy.count - 1 {
                let difference = copy[index + 1] - copy[index]
                copy[index] = difference
            }
            copy.removeLast()
            lastElements.append(copy.last!)
        }
        lastElements.reverse()
        
        var result = 0
        for index in 1..<lastElements.count{
            result = result + lastElements[index]
        }
        sum += result
    }
    print(sum)
}
