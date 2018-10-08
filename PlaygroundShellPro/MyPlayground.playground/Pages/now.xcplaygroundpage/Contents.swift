import Foundation
import PlaygroundSupport

// TODO: replace with your own app id and app key

PlaygroundPage.current.needsIndefiniteExecution = true
let appId = "18f13eaa"
let appKey = "27a056e3a3982744b83c21ea4f30578d"
let language = "en"
let word = "Ace"
let word_id = word.lowercased() //word id is case sensitive and lowercase is required
let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/entries/\(language)/\(word_id)")!
var request = URLRequest(url: url)
request.addValue("application/json", forHTTPHeaderField: "Accept")
request.addValue(appId, forHTTPHeaderField: "app_id")
request.addValue(appKey, forHTTPHeaderField: "app_key")

let session = URLSession.shared
_ = session.dataTask(with: request, completionHandler: { data, response, error in
    if let response = response,
        let data = data,
        let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
        if let JSONString = String(data: data, encoding: String.Encoding.utf8) {
            print(JSONString)
        }
//        print(response)
//        print(jsonData)
    } else {
        print(error)
        print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue))
    }
    PlaygroundPage.current.finishExecution()
}).resume()


