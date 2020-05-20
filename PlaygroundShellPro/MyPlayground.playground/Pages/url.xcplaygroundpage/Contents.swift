import Foundation
import PlaygroundSupport
import UIKit

print("67jkj07")
//#warning("todo: updatejj")



////////////////////////////////
let url = URL(string: "https://api.chucknorris.io/jokes/random")!

let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
    if let data = data,  let str = String(data: data, encoding: .utf8) {
        print("str: \(str)")
    }
//    let json = try? JSONSerialization.jsonObject(with: data ?? Data(), options: [])
//    print(json ?? "n/a")

}

dataTask.resume()
