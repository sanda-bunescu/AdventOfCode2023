import Foundation

let path = "/Users/sanda/Desktop/AdventOfCode/Day 1/input.txt"
var contents = ""
contents = try String(contentsOfFile: path)
let lines = contents.split(separator: "\n")
var sum = 0
var number = 0
for line in lines{
    var finalFirst = 0
    var finalLast = 0
    
    
    let words = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var firstNumber = line.endIndex..<line.endIndex
    for word in words {
        let tmpNumber = line.firstRange(of: word) ?? line.endIndex..<line.endIndex
        if tmpNumber.lowerBound < firstNumber.lowerBound{
            firstNumber = tmpNumber
        }
    }
    let firstDigit = line.first(where: {$0 <= "9" && $0 > "0"})!
    if line.firstIndex(of: firstDigit)! < firstNumber.lowerBound{
        finalFirst = Int(String(firstDigit))!
    }else{
        finalFirst = words.index(after: words.firstIndex(of: String(line[firstNumber]))!)
    }
    
    
    let reversedWords = ["eno", "owt", "eerht", "ruof", "evif", "xis", "neves", "thgie", "enin"]
    let reversedLine = String(line.reversed())
    var lastNumber = reversedLine.endIndex..<reversedLine.endIndex
    for word in reversedWords {
        let tmpNumber = reversedLine.firstRange(of: word) ?? reversedLine.endIndex..<reversedLine.endIndex
        if tmpNumber.lowerBound < lastNumber.lowerBound{
            lastNumber = tmpNumber
        }
    }
    let lastDigit = reversedLine.first(where: {$0 <= "9" && $0 > "0"})!
    if reversedLine.firstIndex(of: lastDigit)! < lastNumber.lowerBound{
        finalLast = Int(String(lastDigit))!
    }else{
        finalLast = reversedWords.index(after: reversedWords.firstIndex(of: String(reversedLine[lastNumber]))!)
    }
    number = finalFirst
    number = number * 10 + finalLast
    sum += number
}
print(sum)
