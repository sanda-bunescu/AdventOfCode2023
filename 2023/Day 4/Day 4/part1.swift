import Foundation

func calculateSumPoints() throws{
    var sum = 0
    let path = "/Users/sanda/Desktop/AdventOfCode2023/2023/Day 4/input.txt"
    let content = try String(contentsOfFile: path)
    let lines = content.split(separator: "\n")
    for line in lines{
        let matches = findMatches(line: line)
        if matches != 0{
            let worth = pow(Double(2), Double(matches - 1))
            sum += Int(worth)
        }
    }
    print("Points: \(sum)")
}
func findMatches(line: String.SubSequence) -> Int{
    var match = 0
    let numbers = line.split(separator: "|")
    let winning = (numbers[0][numbers[0].firstIndex(of: ":")!..<numbers[0].endIndex].trimmingPrefix(":")).split(separator: " ")
    let cardNumbers = numbers[1].split(separator: " ")
    for number in winning{
        if cardNumbers.contains(number){
            match += 1
        }
    }
    return match
}
