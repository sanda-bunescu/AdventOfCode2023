import Foundation

func numberOfInstances() throws{
    var sum = 0
    let path = "/Users/sanda/Desktop/AdventOfCode/Day 4/input.txt"
    let content = try String(contentsOfFile: path)
    let lines = content.split(separator: "\n")
    var array = Array(repeating: 1, count: lines.count)
    for index in 0..<array.count{
        let matches = findMatches(line: lines[index])
        for generated in (index + 1)..<(index + 1) + matches{
            array[generated] += array[index]
        }
        sum += array[index]
    }
    print("Scratchcards: \(sum)")
}
