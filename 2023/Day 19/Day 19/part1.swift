import Foundation
var dict = [String: [String]]()
func partsSum(content: String){
    let sections = content.split(separator: "\n\n")
    let workflows = sections[0].split(separator: "\n")
    let parts = sections[1].split(separator: "\n")
    for workflow in workflows{
        processWorkflows(workflow: String(workflow))
    }
    let startWorkflow = "in"
    var sum = 0
    for part in parts{
        let categories = part.split(separator: ",")
        let (x,m,a,s) = (Int(categories[0].split(separator: "=")[1])! , Int(categories[1].split(separator: "=")[1])! , Int(categories[2].split(separator: "=")[1])! , Int(categories[3].split(separator: "=")[1].split(separator: "}")[0])!)
        let partDictionary = [
            "x" : x ,
            "m" : m ,
            "a" : a ,
            "s" : s
        ]
        let result = identifyCompability(part: partDictionary , workflowName: startWorkflow)
        if result == "A"{
            sum += (x + m + a + s)
        }
    }
    print(sum)

}
func processWorkflows(workflow: String){
    let sections = workflow.split(separator: "{")
    dict[String(sections[0])] = String(sections[1]).split(separator: ",").map{String($0)}
}
func identifyCompability(part: [String: Int] , workflowName: String) -> String{
    let ifElseArray = dict[workflowName]!
    for condition in ifElseArray{
        var category = ""
        var value = 0
        var result = ""
        if condition.contains(">"){
            category = String(condition[condition.startIndex..<condition.firstIndex(of: ">")!])
            value = Int(String(condition[condition.index(after: condition.firstIndex(of: ">")!)..<condition.firstIndex(of: ":")!]))!
            if part[category]! > value{
                result = String(condition[condition.index(after: condition.firstIndex(of: ":")!)..<condition.endIndex])
                if result.elementsEqual("A"){
                    return "A"
                }else if result.elementsEqual("R"){
                    return "R"
                }else{
                    return identifyCompability(part: part, workflowName: result)
                }
            }else{
                continue
            }
        }
        if condition.contains("<"){
            category = String(condition[condition.startIndex..<condition.firstIndex(of: "<")!])
            value = Int(String(condition[condition.index(after: condition.firstIndex(of: "<")!)..<condition.firstIndex(of: ":")!]))!
            if part[category]! < value{
                result = String(condition[condition.index(after: condition.firstIndex(of: ":")!)..<condition.endIndex])
                if result.elementsEqual("A"){
                    return "A"
                }else if result.elementsEqual("R"){
                    return "R"
                }else{
                    return identifyCompability(part: part, workflowName: result)
                }
            }else{
                continue
            }
        }
        
        if condition.elementsEqual("A}"){
            return "A"
        }else if condition.elementsEqual("R}"){
            return "R"
        }else{
            return identifyCompability(part: part, workflowName: String(condition[condition.startIndex..<condition.index(before: condition.endIndex)]))
        }
    }
    return ""
}
