import Foundation
import PlaygroundSupport
import UIKit

print("67jk444j07")
//#warning("todo: updatejj")



////////////////////////////////
//PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://api.github.com/repos/johnsundell/publish")!
let publisher = URLSession.shared.dataTaskPublisher(for: url)

let repoPublisher = publisher
    .map(\.data)
    .decode(type: Repository.self, decoder: JSONDecoder())

let cancellable = repoPublisher.sink(receiveCompletion: { (completion) in
    switch completion {
    case .failure(let error):
        print(error)
    case .finished:
        print("Success")

    }
}) { repo in
    print(repo)
}

struct Repository: Codable {
    var name: String
    var url: URL
}
