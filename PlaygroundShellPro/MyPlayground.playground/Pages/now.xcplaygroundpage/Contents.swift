import Foundation
import PlaygroundSupport
import UIKit

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!

let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
    let json = try? JSONSerialization.jsonObject(with: data ?? Data(), options: [])
    print(json ?? "n/a")

}

dataTask.resume()

