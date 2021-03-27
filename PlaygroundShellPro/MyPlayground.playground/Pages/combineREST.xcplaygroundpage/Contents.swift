
import Foundation

import Combine

print("dfdf")

var cancellables = Set<AnyCancellable>()

class MyClass {
    var rz: String = ""
}

let url = URL(string: "https://api.chucknorris.io/jokes/random")!
var myObject = MyClass()
URLSession
    .shared
    .dataTaskPublisher(for: url)
//    .map(\.data)
    .map{ String(data: $0.data, encoding: .utf8) }
//    .replaceError(with: [])
//    .receive(on: RunLoop.main)
    .sink(receiveCompletion: { completion in

       }) { post in
           print(post!)
       }
    .store(in: &cancellables)
