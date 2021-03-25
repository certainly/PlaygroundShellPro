import Foundation
import PlaygroundSupport
//import UIKit

print("67jkj07")
//#warning("todo: updatejj")



////////////////////////////////

//func loadQuestion() {
//
//    let resource = QuestionsResource(id: 60043628)
//    let request = APIRequest(resource: resource)
//    self.questionRequest = request
//    request.execute { [weak self] questions in
//        guard let question = questions?.first else { return }
//
//    }
//}
var aRequest : StringRequest?
private var jokeRequest: APIRequest<JokeResource>?
func loadString() {
    let url = URL(string: "https://api.chucknorris.io/jokes/random")!
//    let url = URL(string: "https://www.starwars.com")!
//    let url = URL(string: "https://www.baidu.com")!
    aRequest = StringRequest(url: url)
    aRequest?.execute { str in
        print("String: \(str)")
        exit(0)
    }

}

func loadJoke() {
    let resource = JokeResource()
    let request = APIRequest(resource: resource)
    jokeRequest = request
    jokeRequest?.execute { data in
        print("data: \(data)")
        exit(0)
    }

}

//loadJoke()
loadString()


//if true { exit(0) }
//let url = URL(string: "https://api.chucknorris.io/jokes/random")!
let url = URL(string: "https://justmysocks3.net/members/getbwcounter.php?service=62051&id=a3ba05f3-ba90-4e7b-83c2-48fad6fbefbc")!
//let url = URL(string: "https://www.baidu.com")!

//let cancellable = URLSession.shared.dataTaskPublisher(for: url)
////    .map{ String(data: $0.data, encoding: .utf8) }
//    .map (\.data)
////    .compactMap {$0}
//    .decode(type: Counter.self, decoder: JSONDecoder())
//    .sink { completion in
////        print(completion) // finished
//    } receiveValue: { counter in
//        print(counter)
//        //        if let str = String(data: place, encoding: .utf8) {
//        //            print(str)
//        //        }
//        //        print("\(ByteCountFormatter().string(fromByteCount: Int64(place.bw_counter_b)))")
//        let byteFormatter = ByteCountFormatter()
////        byteFormatter.countStyle = .binary
////        byteFormatter.includesActualByteCount = true
////        byteFormatter.includesUnit = false
//        let out = byteFormatter.string(fromByteCount: Int64(counter.bw_counter_b))
//        let out2 = byteFormatter.string(fromByteCount: Int64(100_000_000_100 - 263894665))
//        print(out)
//        exit(EXIT_SUCCESS)
//    }
//
////URLSession.shared.dataTask(with: url) { (data, _, error) in
////    if let data = data,  let str = String(data: data, encoding: .utf8) {
////        print("str: \(str)")
////        if let rz = try? JSONDecoder().decode(Counter.self, from: data ).bw_counter_b {
////            let out = ByteCountFormatter().string(fromByteCount: Int64(rz))
////            print("rz: \(rz)")
////            print("out: \(out)")
////        }
////
////    } else if error != nil {
////        print(error?.localizedDescription ?? "error..")
////    }
////}.resume()
//
////let cancellable = URLSession.shared.dataTaskPublisher(for: url)
//////    .map (\.data)
////    .map{ String(data: $0.data, encoding: .utf8) }
////    .compactMap {$0}
//////    .decode(type: Counter.self, decoder: JSONDecoder())
//////    .receive(on: RunLoop.main)
//////    //.replaceError(with: [])
//////    .eraseToAnyPublisher()÷
////    .sink(receiveCompletion: { completion in
//////        print(completion) // finished
////    }) { place in
////        print(place)
//////        if let str = String(data: place, encoding: .utf8) {
//////            print(str)
//////        }
//////        print("\(ByteCountFormatter().string(fromByteCount: Int64(place.bw_counter_b)))")
////        exit(EXIT_SUCCESS)
////    }
//
//
//
//struct Counter: Codable {
//    var monthly_bw_limit_b: Int
//    var bw_counter_b: Int
//    var bw_reset_day_of_month: Int
//}



//let url = URL(string: "https://rss.itunes.apple.com/api/v1/US/apple-music/hot-tracks/all/50/explicit.json")!
//
//let cancellable = URLSession.shared.dataTaskPublisher(for: url)
//    .map(\.data)
//    .decode(type: Feed.self, decoder: JSONDecoder())
//    .sink { completion in
////        print(completion) // finished
//    } receiveValue: { counter in
//        print(counter)
//        //        if let str = String(data: place, encoding: .utf8) {
//        //            print(str)
//        //        }
//
//
//
//        exit(EXIT_SUCCESS)
//    }
