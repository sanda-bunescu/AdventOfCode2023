import Foundation
func possibleIDs() throws{
    let path = "/Users/sanda/Desktop/AdventOfCode/Day 2/input.txt"
    let content = try String(contentsOfFile: path)
    let lines = content.split(separator: "\n")
    let idRegex = /[1-9][0-9]*/
    var sum = 0
    for line in lines {
        var isPossible = true
        let id = try idRegex.firstMatch(in: line)!.0
        let parts = line.split(separator: ";")
        for part in parts{
            let rgb = [12 , 13 , 14]
            let words = part.split(separator: " ")
            for index in 0..<words.count {
                if words[index].elementsEqual("red") || words[index].elementsEqual("red,"){
                    if Int(words[index - 1])! > rgb[0]{
                        isPossible = false
                        break
                    }
                }
                if words[index].elementsEqual("green") || words[index].elementsEqual("green,"){
                    if Int(words[index - 1])! > rgb[1]{
                        isPossible = false
                        break
                    }
                }
                if words[index].elementsEqual("blue") || words[index].elementsEqual("blue,"){
                    if Int(words[index - 1])! > rgb[2]{
                        isPossible = false
                        break
                    }
                }
            }
            if isPossible == false{
                break
            }
            
        }
        if isPossible == true{
            sum += Int(id)!
        }
    }
    print("ID sum: \(sum)")
}
