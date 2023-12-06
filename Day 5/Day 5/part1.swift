
import Foundation

func findLowestLocation() throws {
    let path = "/Users/sanda/Desktop/AdventOfCode/Day 5/input.txt"
    let content = try String(contentsOfFile: path)
    var seedsArray = content[content.firstIndex(of: ":")!..<content.firstIndex(of: "\n")!]
    seedsArray.trimPrefix(": ")
    let seeds = seedsArray.split(separator: " ").map{Int($0)!}
    
    var maps = content.split(separator: "\n\n")
    maps.removeFirst()
    
    var finalArray = [[[Int]]]()
    for map in maps{
        var values = map.split(separator: "\n")
        values.removeFirst()
        var mapArray = [[Int]]()
        for value in values{
            let toAppend = value.split(separator: " ").map{ Int($0)!}
            mapArray.append(toAppend)
        }
        finalArray.append(mapArray)
    }
    var lastLocation = Int.max
    for seed in seeds{
        var currentSeed = seed
        for arrayWithArrays in finalArray{
            var lowestHighest = 0
            var distance = 0
            var source = 0
            for array in arrayWithArrays {
                if currentSeed >= array[1] && lowestHighest <= array[1]{
                    lowestHighest = array[1]
                    source = array[0]
                    distance = array[2]
                }
            }
            if lowestHighest + distance - 1 >= currentSeed{
                currentSeed = currentSeed - (lowestHighest - source)
            }
            
        }
        lastLocation = min(currentSeed,lastLocation)
    }
    print("Lowest Location: \(lastLocation)")
}
