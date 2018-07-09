import UIKit
import PlaygroundSupport

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}

var url:URL = "http://www.baidu.com"
let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
    let ss = String(data: data!, encoding: .utf8)!
    print(ss)
    PlaygroundPage.current.finishExecution()
}

task.resume()

PlaygroundPage.current.needsIndefiniteExecution = true

