import Foundation
import PlaygroundSupport
import UIKit

print("67jkj07")
//#warning("todo: updatejj")



////////////////////////////////
//PlaygroundPage.current.needsIndefiniteExecution = true
func parse()  {
    var urlComponents = URLComponents()
    urlComponents.scheme = "http"
    urlComponents.host = "baidu.com"
//    urlComponents.port = 801
    guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"

    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let task = session.dataTask(with: request) { (responseData, response, responseError) in
        print("response ...")
        guard responseError == nil else {
            print("fail: \(responseError?.localizedDescription)")
            return
        }

        guard let jsonData = responseData else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
            print("error \(error)")
            return
        }

        // print string
        if let returnData = String(data: jsonData, encoding: .utf8) {
                        print("jsondata: \(returnData)")
        }
    }
    task.resume()
}

parse()
