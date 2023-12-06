import Foundation

func printNumbers() throws{
    let path = "/Users/sanda/Desktop/AdventOfCode/Day 2/input.txt"
    let content = try String(contentsOfFile: path)
    let lines = content.split(separator: "\n")
    var sum = 0
    for line in lines {
        var power = 0
        var rgb = [0,0,0]
        let parts = line.split(separator: " ")
        for index in 0..<parts.count{
            if parts[index].elementsEqual("red") || parts[index].elementsEqual("red,") || parts[index].elementsEqual("red;"){
                if Int(parts[index - 1])! > rgb[0]{
                    rgb[0] = Int(parts[index - 1])!
                }
            }
            if parts[index].elementsEqual("green") || parts[index].elementsEqual("green,") || parts[index].elementsEqual("green;"){
                if Int(parts[index - 1])! > rgb[1]{
                    rgb[1] = Int(parts[index - 1])!
                }
            }
            if parts[index].elementsEqual("blue") || parts[index].elementsEqual("blue,") || parts[index].elementsEqual("blue;"){
                if Int(parts[index - 1])! > rgb[2]{
                    rgb[2] = Int(parts[index - 1])!
                }
            }
            
        }
        power = rgb[0] * rgb[1] * rgb[2]
        sum += power
    }
    print("Power sum: \(sum)")
}


