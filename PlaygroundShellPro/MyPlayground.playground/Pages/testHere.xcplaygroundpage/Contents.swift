//: [Previous](@previous)

import Foundation
import PlaygroundSupport

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
//let url = URL(string: "http://api.plos.org/search?q=title:DNA")!

let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
    let json = try? JSONSerialization.jsonObject(with: data ?? Data(), options: [])
    print(json ?? "n/a")
    PlaygroundPage.current.finishExecution()
}

dataTask.resume()
