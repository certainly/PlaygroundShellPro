//: [Previous](@previous)

import Foundation
import PlaygroundSupport
var str = "Hello, playground"

//: [Next](@next)

DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    // do stuff 42 seconds later
    print("out now")
    //    Timelog.stop()
}

PlaygroundPage.current.needsIndefiniteExecution = true



let arr = [1,2,4,5,666,44]

struct Beer: Codable {
    let name: String
    let brewery: [Int]
    
}
let jsonData = """
{
"name": "Endeavor",
"abv": 8.9,
"brewery": [56,45,55,5]
}
""".data(using: .utf8)!


let decoder = JSONDecoder()
let beer = try! decoder.decode(Beer.self, from: jsonData)
dump(beer)


