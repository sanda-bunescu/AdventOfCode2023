
import Foundation

func marginOfError() {
    let path = "/Users/sanda/Desktop/AdventOfCode2023/2023/Day 6/input.txt"
    let content = try! String(contentsOfFile: path)

    let timeArray = (content.split(separator: "\n"))[0].trimmingPrefix("Time:").split(separator: " ").map{ Int($0)!}
    let distanceArray = content.split(separator: "\n")[1].trimmingPrefix("Distance:").split(separator: " ").map{ Int($0)!}
    
    var product = 1
    for index in 0..<timeArray.count{
        var beatRecord = 0
        for i in 1..<timeArray[index]{
            beatRecord = i * (timeArray[index] - i) > distanceArray[index] ? beatRecord + 1 : beatRecord
        }
        product *= beatRecord
    }
    print(product)
    
}
