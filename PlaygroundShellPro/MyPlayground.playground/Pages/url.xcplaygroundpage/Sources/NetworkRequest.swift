//
//  NetworkRequest.swift
//  TopQuestion
//
//  Created by Matteo Manferdini on 12/09/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import Foundation


// MARK: - NetworkRequest
public protocol NetworkRequest: AnyObject {
	associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
	fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
		let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _ , _) -> Void in

//            print("333")
//            print(self)
//            if let data = data {
//                print(String(data: data, encoding: .utf8))
//                print(data.count)
//                let decoder = JSONDecoder()
//                let tt = try? decoder.decode(Joke.self, from: data)
//                print("az \(tt)")
//            }
//            print("3434")
			guard let data = data, let value = self?.decode(data) else {
				DispatchQueue.main.async { completion(nil) }
				return
			}
			 completion(value) 
		}
		task.resume()
	}
}



// MARK: - StringRequest
public class StringRequest {
    public let url: URL
    public init(url: URL) {
        self.url = url
    }
}

extension StringRequest: NetworkRequest {
    public func execute(withCompletion completion: @escaping (String?) -> Void) {
        load(url, withCompletion: completion)
    }

    public func decode(_ data: Data) -> String? {
        return  String(data: data, encoding: .utf8)
    }
}

// MARK: - APIRequest
public class APIRequest<Resource: APIResource> {
	let resource: Resource
	
	public init(resource: Resource) {
		self.resource = resource
	}
}

extension APIRequest: NetworkRequest {
    public func decode(_ data: Data) -> Resource.ModelType?{
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .secondsSince1970
		let wrapper = try? decoder.decode(Resource.ModelType.self, from: data)
        return wrapper
	}
	
    public func execute(withCompletion completion: @escaping (Resource.ModelType?) -> Void) {
		load(resource.url, withCompletion: completion)
	}
}

// MARK: - APIResource
public protocol APIResource {
	associatedtype ModelType: Decodable
	var methodPath: String { get }
	var filter: String? { get }
    var url: URL { get }
}

extension APIResource {

//	var url: URL {
//		var components = URLComponents(string: "https://api.stackexchange.com/2.2")!
//		components.path = methodPath
//		components.queryItems = [
//			URLQueryItem(name: "site", value: "stackoverflow"),
//			URLQueryItem(name: "order", value: "desc"),
//			URLQueryItem(name: "sort", value: "votes"),
//			URLQueryItem(name: "tagged", value: "swiftui"),
//			URLQueryItem(name: "pagesize", value: "10")
//		]
//		if let filter = filter {
//			components.queryItems?.append(URLQueryItem(name: "filter", value: filter))
//		}
//		return components.url!
//	}
}

// MARK: - Wrapper
public struct Wrapper<T: Decodable>: Decodable {
    let items: [T]
}

// MARK: - JokeResource
//public struct JokeResource: APIResource {
//    public var url: URL = URL(string: "https://api.chucknorris.io/jokes/random")!
//
//    public var methodPath: String = ""
//
//    public var filter: String?
//
//    public typealias ModelType = Joke
//
//
//    public init() {
//
//    }
//
//}




public struct JSONObjResource<T: Decodable>: APIResource {
    public typealias ModelType = T


    public var url: URL = URL(string: "https://www.baidu.com")!

    public var methodPath: String = ""

    public var filter: String?



    public init(ofurl: String) {
        url  = URL(string: ofurl )!
    }

}

// MARK: - QuestionsResource
//public struct QuestionsResource: APIResource {
//    public typealias ModelType = Question
//	public var id: Int?
//
//
//
//    public var methodPath: String {
//		guard let id = id else {
//			return "/questions"
//		}
//		return "/questions/\(id)"
//	}
//
//    public var filter: String? {
//		id != nil ? "!9_bDDxJY5" : nil
//	}
//}
