import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

if let url = URL(string: "https://apple.com") {
    var request = URLRequest(url: url)
    request.httpMethod = "HEAD"
    URLSession(configuration: .default)
        .dataTask(with: request) { (_, response, error) -> Void in
            guard error == nil else {
                print("Error:", error ?? "")
                return
            }

            guard (response as? HTTPURLResponse)?
                .statusCode == 200 else {
                    print("down")
                    return
            }

            print("up")
        }
        .resume()
}
