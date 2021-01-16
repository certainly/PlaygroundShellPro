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


let url1 = URL(string: "https://jsonplaceholder.typicode.com/posts")!
let url2 = URL(string: "https://jsonplaceholder.typicode.com/todos")!

let publisher1 = URLSession.shared.dataTaskPublisher(for: url1)
.map { $0.data }
.decode(type: [Post].self, decoder: JSONDecoder())

let publisher2 = URLSession.shared.dataTaskPublisher(for: url2)
.map { $0.data }
.decode(type: [Todo].self, decoder: JSONDecoder())

let cancellable = Publishers.Zip(publisher1, publisher2)
.eraseToAnyPublisher()
.catch { _ in
    Just(([], []))
}
.sink(receiveValue: { posts, todos in
    print(posts.count)
    print(todos.count)
})

enum HTTPError: LocalizedError {
    case statusCode
    case post
}

struct Post: Codable {

    let id: Int
    let title: String
    let body: String
    let userId: Int
}

struct Todo: Codable {

    let id: Int
    let title: String
    let completed: Bool
    let userId: Int
}
let url = URL(string: "https://www.baidu.com")!
let cancellable2 = URLSession.shared.dataTaskPublisher(for: url1)
    .map{ String(data: $0.data, encoding: .utf8) }
    .sink { completion in
//        print(completion) // finished
    } receiveValue: { counter in
        print(counter)
      
    }

