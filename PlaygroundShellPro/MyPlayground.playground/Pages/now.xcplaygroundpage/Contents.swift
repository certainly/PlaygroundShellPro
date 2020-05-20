import Foundation
import PlaygroundSupport
import UIKit

print("67jk444j07")
//#warning("todo: updatejj")



////////////////////////////////
//PlaygroundPage.current.needsIndefiniteExecution = true


extension URLSession {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void

    @discardableResult
    func request(
        _ endpoint: Endpoint,
        then handler: @escaping Handler
    ) -> URLSessionDataTask {
        let task = dataTask(
            with: endpoint.url,
            completionHandler: handler
        )

        task.resume()
        return task
    }
}

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
//        components.host = "api.myapp.com"
        components.host = "www.baidu.com"
        components.path = "/" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }

        return url
    }
}
extension Endpoint {
    static var recommendations: Self {
        Endpoint(path: "recommendations")
    }

    static func article(withID id: Int) -> Self {
        Endpoint(path: "articles/\(id)")
    }

    static func search(for query: String,
                       maxResultCount: Int = 100) -> Self {
        Endpoint(
            path: "search/\(query)",
            queryItems: [URLQueryItem(
                name: "count",
                value: String(maxResultCount)
            )]
        )
    }
}

func loadArticle(withID id: Int,
                 using session: URLSession = .shared) {
    session.request(.article(withID: id)) {
        data, response, error in
        if let error = error {
            print(error.localizedDescription)
            exit(EXIT_FAILURE)
        }
        if let data = data, let str = String(data: data, encoding: .utf8) {
            print("data: \(str)")
        }
        print("ddd")
    }

//    let url = URL(string: "https://api.myapp.com/articles/3")!
//
//    let task = URLSession.shared.dataTask(with: url) {
//          data, response, error in
//      }
//
//      task.resume()
}

loadArticle(withID: 33)

