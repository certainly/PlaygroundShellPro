import Foundation
import PlaygroundSupport
//import UIKit
//import SwiftUI

import Combine
//import os
import Darwin
import os

print("2267jk4j07")
//#warning("todo: updatejj")




////////////////////////////////

//import Foundation
//import Combine

var storage = Set<AnyCancellable>()

struct Cat: Codable {
    let name: String
    let age: Int
}

func requestCat(_ cat: Cat) -> AnyPublisher<Data, Never> {
    // no error handling - just demo purposes
    let data = try! JSONEncoder().encode(cat)
    return Just(data)
        .eraseToAnyPublisher()
}

let cat = Cat(name: "Gloria", age: 2)

requestCat(cat)
    .decode(type: Cat.self, decoder: JSONDecoder())
    .map { $0.name }
    .sink { completion in
        print("completed: \(completion)")
    } receiveValue: { name in
        print("cat's name is \(name)")
    }.store(in: &storage)
