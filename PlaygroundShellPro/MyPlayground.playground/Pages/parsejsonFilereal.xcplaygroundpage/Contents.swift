import Foundation
import PlaygroundSupport

public final class DataManager {
    public static func getJSONFromURL(_ resource:String, completion:@escaping (_ data:Data?, _ error:Error?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let filePath = Bundle.main.path(forResource: resource, ofType: "json")
            let url = URL(fileURLWithPath: filePath!)
            let data = try! Data(contentsOf: url, options: .uncached)
            completion(data, nil)
        }

    }

    public static func getStringFromURL(_ resource:String, completion:@escaping (_ str:String?, _ error:Error?) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let filePath = Bundle.main.path(forResource: resource, ofType: "txt")
            let url = URL(fileURLWithPath: filePath!)
            let data = try! Data(contentsOf: url, options: .uncached)
            let str = String(data: data, encoding: .utf8)
            completion(str, nil)
        }

    }
}

public struct Car: Codable {
    let id: Int
    let color: String
    let make: String
    let model: String
    let year: String
}

public struct Country: Codable {
    let name: String
    let dial_code: String
    let code: String
}

public var dataStr: String = ""
let fileManager = FileManager()
public func test() {
    DataManager.getJSONFromURL("CountyCodes") { (data, error) in
        guard let data = data else {
            PlaygroundPage.current.finishExecution()
        }

//        let str = String(data: data, encoding: .utf8)
//        print(str)
        let decoder = JSONDecoder()
        do {
            let cars = try decoder.decode([Country].self, from: data)
            var count = 0
//            for car in cars {
//                let code = car.code
//                let keyword = "<option value=\"\(code)\">"
//                if dataStr.range(of: keyword, options: .caseInsensitive) != nil{
//                    count += 1
//                }
//            }
           let newCars =  cars.filter{
                let code = $0.code
                let keyword = "<option value=\"\(code)\">"
                return  dataStr.range(of: keyword, options: .caseInsensitive) != nil
            }
            print(count)
            print(newCars.count)

//            do {
//                let data = try encoder.encode(newCars)
//                let filePath = Bundle.main.path(forResource: "newcars", ofType: "txt")
//                let url = URL(fileURLWithPath: filePath!)
//                FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
//            } catch {
//                fatalError(error.localizedDescription)
//            }
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(newCars)
                let filePath = Bundle.main.path(forResource: "newcars", ofType: "json")
                let url = URL(fileURLWithPath: filePath!)
                print(url.path)
                // 3. Check if posts.json already exists...
                if fileManager.fileExists(atPath: url.path) {
                    // ... and if it does, remove it
                    try fileManager.removeItem(at: url)
                }
                // 4. Now create posts.json with the data encoded from our array of Posts
                fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
            } catch {
                fatalError(error.localizedDescription)
            }


            PlaygroundPage.current.finishExecution()
        } catch  {
            print("failed to convert data")
            PlaygroundPage.current.finishExecution()
        }
    }
}

DataManager.getStringFromURL("ItunesList") { (str, error) in
    guard let str = str else {
        PlaygroundPage.current.finishExecution()
    }
    dataStr = str
    test()
//    print(str)
//    PlaygroundPage.current.finishExecution()

 

}



PlaygroundPage.current.needsIndefiniteExecution = true

