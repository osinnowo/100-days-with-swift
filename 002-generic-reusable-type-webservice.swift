import Foundation

protocol Model {}

enum HttpMethod {
    case GET
    case POST
    case PUT
    case DELETE
    case OPTIONS
}

enum HttpError: Error {
    case urlError
    case responseError
    case decodingError
}

struct Person: Decodable {
    var id: Int
    var name: String
}

struct Empty: Encodable, Model {}

protocol WebServiceProtocol where T: Encodable & Model, R: Decodable {
    associatedtype T
    associatedtype R
    
    func initiate(path: String, method: HttpMethod, debuggable: Bool, body: T?, onCompletion: @escaping (Result<R, HttpError>) -> Void)
}

final class WebService<Request: Encodable & Model, Response: Decodable>: WebServiceProtocol {
    typealias T = Request
    typealias R = Response
    
    func initiate(path: String, method: HttpMethod = .GET, debuggable: Bool = false, body: Request? = nil, onCompletion: @escaping (Result<Response, HttpError>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/\(path)") else {
            onCompletion(.failure(HttpError.urlError))
            return
        }
        
        var request = URLRequest(url: url)
        
        if let rawRequest = try? JSONEncoder().encode(body), method == .POST {
            request.httpBody = rawRequest
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                onCompletion(.failure(HttpError.responseError))
                return
            }
            
            do {
                if let raw = String(data: data, encoding: .utf8), debuggable {
                    print("Raw Response")
                    print(raw)
                }
                
                let res = try JSONDecoder().decode(Response.self, from: data)
                onCompletion(.success(res))
                
            } catch {
                onCompletion(.failure(HttpError.decodingError))
            }
            CFRunLoopStop(CFRunLoopGetCurrent())
        }
        
        dataTask.resume()
        CFRunLoopRun()
    }
}

let webService = WebService<Empty, [Person]>()

webService.initiate(path: "users", debuggable: true) { result in
    switch result {
        case .success(let response):
            for person in response {
                print("Name: \(person.name) | Id: \(person.id)")
            }
            
        case .failure(let error):
             print(error.localizedDescription)
    }
}

