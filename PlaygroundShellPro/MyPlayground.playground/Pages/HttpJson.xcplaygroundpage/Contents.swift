import Foundation
import PlaygroundSupport

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}


enum Result<Value> {
    case success(Value)
    case failure(Error)
}

func getPosts(for userId: Int, completion: ((Result<[Post]>) -> Void)?) {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "jsonplaceholder.typicode.com"
    urlComponents.path = "/posts"
    let userIdItem = URLQueryItem(name: "userId", value: "\(userId)")
    urlComponents.queryItems = [userIdItem]
    guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let task = session.dataTask(with: request) { (responseData, response, responseError) in
        DispatchQueue.main.async {
            guard responseError == nil else {
                completion?(.failure(responseError!))
                return
            }
            
            guard let jsonData = responseData else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                completion?(.failure(error))
                return
            }
            
            // Now we have jsonData, Data representation of the JSON returned to us
            // from our URLRequest...
            
            // Create an instance of JSONDecoder to decode the JSON data to our
            // Codable struct
            let decoder = JSONDecoder()
            
            do {
                // We would use Post.self for JSON representing a single Post
                // object, and [Post].self for JSON representing an array of
                // Post objects
                
                let posts = try decoder.decode([Post].self, from: jsonData)
                completion?(.success(posts))
            } catch {
                completion?(.failure(error))
            }
        }
    }
    
    task.resume()
}

var postsGlobal = [Post]()

func buttonTapped() {
    getPosts(for: 1) { (result) in
        switch result {
        case .success(let posts):
            postsGlobal = posts
            dump(posts)
        case .failure(let error):
            fatalError("error: \(error.localizedDescription)")
        }
        PlaygroundPage.current.finishExecution()
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true
buttonTapped()

