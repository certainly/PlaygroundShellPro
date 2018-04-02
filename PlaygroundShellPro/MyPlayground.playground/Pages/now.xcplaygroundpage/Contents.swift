//class Key {}
//class Pitch {}
//
//protocol Tune {
//    unowned var key: Key { get set }
//    weak var pitch: Pitch? { get set}
//}
//
//class Instrument: Tune {
//    var key: Key
//    var pitch: Pitch?
//}
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
print("7744")

func completeExecution() {
    PlaygroundPage.current.finishExecution()
}

if let url = URL(string: "https://www.baidu.com") {
    let session = URLSession.shared
    let task = session.dataTask(with: url) { (data, response, error) in
        print("1")
        guard error == nil else {
            print(error?.localizedDescription ?? "")
            return
        }

        DispatchQueue.main.async {

            print(Thread.current)

            print("DispatchQueue.main.async immediately")

        }
        print("df44d")
         print("111df44d")
        print("\(data?.count)")
        if let contents = String(data:data!, encoding:.utf8){
            print(contents)
        }
        completeExecution()
    }.resume()

}
