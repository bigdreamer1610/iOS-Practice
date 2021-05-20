import Foundation

// basic
let defaults = UserDefaults.standard

// global variables

class Manager {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let leadManager = Manager(name: "Tony")

// static property

protocol URLSessionProtocol {}

extension URLSession : URLSessionProtocol {}

class ApiManage {

    static let shared: ApiManage = ApiManage(withSession: URLSession.shared)
    
    let session: URLSessionProtocol

    init(withSession session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
}

let apiManage = ApiManage.shared


