import Foundation

func calculateSum2(content: String){
    let parts = content.split(separator: ",")
    var hashmap = [Int: [(String , String)]]()
    for part in parts{
        let minus = part.firstIndex(of: "-") ?? part.startIndex
        let equal = part.firstIndex(of: "=") ?? part.startIndex
        if minus != part.startIndex{
            let toAppend = part.split(separator: "-")
            if hashmap[returnBox(part: String(toAppend[0])), default: []].contains(where: {$0.0.elementsEqual(toAppend[0])}) {
                hashmap[returnBox(part: String(toAppend[0])), default: []].removeAll(where: {$0.0.elementsEqual(toAppend[0])})
            }
        }
        if equal != part.startIndex{
            let toAppend = part.split(separator: "=")
            if hashmap[returnBox(part: String(toAppend[0])), default: []].contains(where: {$0.0.elementsEqual(toAppend[0])}) {
                let i = hashmap[returnBox(part: String(toAppend[0])),default: []].firstIndex(where: {$0.0.elementsEqual(toAppend[0])})!
                hashmap[returnBox(part: String(toAppend[0])),default: []].replaceSubrange(i...i, with: [(String(toAppend[0]) , String(toAppend[1]))])
            }else{
                hashmap[returnBox(part: String(toAppend[0])), default: []].append((String(toAppend[0]) , String(toAppend[1])))
            }
        
        }
    }
    var total = 0
    for box in hashmap{
        for elementSlot in 0..<box.value.count{
            let focusingPower = (box.key + 1) * (elementSlot + 1) * Int(box.value[elementSlot].1)!
            total += focusingPower
        }
    }
    print(total)
}

func returnBox(part: String) -> Int{
    var currentValue = 0
    for char in part{
        currentValue = ((currentValue + Int(char.asciiValue!)) * 17) % 256
    }
    return currentValue
}
