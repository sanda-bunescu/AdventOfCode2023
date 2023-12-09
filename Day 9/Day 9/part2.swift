import Foundation

func firstElementsSum(content: String){
    let lines = convert(content: content)
    var sum = 0
    for line in lines{
        var copy = line
        var firstElements = [Int]()
        firstElements.append(line.first!)
        while !copy.allSatisfy({ $0 == 0 }){
            for index in 0..<copy.count - 1 {
                let difference = copy[index + 1] - copy[index]
                copy[index] = difference
            }
            copy.removeLast()
            firstElements.append(copy.first!)
        }
        firstElements.reverse()
        var result = 0
        for index in 1..<firstElements.count{
            result = -result + firstElements[index]
        }
        sum += result
    }
    print(sum)
}
