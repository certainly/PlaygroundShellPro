
import Foundation

import Combine

print("dfdf")


//let urlString = "https://api.chucknorris.io/jokes/random"
//let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/hot-tracks/all/50/explicit.json"
let urlString = "https://justmysocks3.net/members/getbwcounter.php?service=62051&id=a3ba05f3-ba90-4e7b-83c2-48fad6fbefbc"
let url = URL(string: urlString)!

var cancellables = URLSession.shared
    .dataTaskPublisher(for: url)
    .map(\.data)
    .map(\.prettyJson!)
//    .map { String(decoding: $0, as: UTF8.self) }
    

//    .decode(type: Counter.self, decoder: JSONDecoder())

    .sink(receiveCompletion: { completion in

       }) { post in
           print(post)
       }
//    .store(in: &cancellables)

struct Counter: Codable {
    var monthly_bw_limit_b: Int
    var bw_counter_b: Int
    var bw_reset_day_of_month: Int
}

extension Data {
    var prettyJson: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding:.utf8) else { return nil }

        return prettyPrintedString
    }
}
