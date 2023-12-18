
import Foundation

func calculateSum(content: String){
    let parts = content.split(separator: ",")
    var sum = 0
    for part in parts{
        sum += modifyValue(part: String(part))
    }
    print(sum)
}

func modifyValue(part: String) -> Int{
    var currentValue = 0
    for char in part{
        currentValue = ( (currentValue + Int(char.asciiValue!)) * 17) % 256
    }
    return currentValue
}
