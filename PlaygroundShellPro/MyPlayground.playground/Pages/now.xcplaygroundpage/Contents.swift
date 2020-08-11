import Foundation
import PlaygroundSupport
import UIKit

//import os

import os.log

print("67jk444j07")
//#warning("todo: updatejj")




////////////////////////////////


let config = URLSessionConfiguration.default
config.waitsForConnectivity = true
config.timeoutIntervalForResource = 300

let session = URLSession(configuration: config)

let url = URL(string: "https://www.example.com/")!

session.dataTask(with: url) { data, response, error in
    // ...
}
