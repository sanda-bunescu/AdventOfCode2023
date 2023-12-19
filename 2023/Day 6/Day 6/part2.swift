
import Foundation

func marginOfError2() {
    let path = "/Users/sanda/Desktop/AdventOfCode2023/2023/Day 6/input.txt"
    let content = try! String(contentsOfFile: path)

    let timeString = (content.split(separator: "\n"))[0].trimmingPrefix("Time:").split(separator: " ").joined()
    let finalTime = Int(timeString)!
    let distanceString = content.split(separator: "\n")[1].trimmingPrefix("Distance:").split(separator: " ").joined()
    let finalDistance = Int(distanceString)!
    
    var beatRecord = 0
    for i in 1..<finalTime{
        beatRecord = i * (finalTime - i) > finalDistance ? beatRecord + 1 : beatRecord
    }
    print(beatRecord)
}
