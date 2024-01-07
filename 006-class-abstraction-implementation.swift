import Foundation

protocol DatabaseProtocol {
    func connect()
    func query()
}

extension DatabaseProtocol {
    func query() {
        //TODO: Concrete implementation
        print("Querying...")
    }
}

class Database: DatabaseProtocol {
    func connect() {
        //TODO: Implement concrete implementation for abstract method (it's now an abstract method since there isn't no default implementation)
        print("Initiating connection...")
    }
}


let connector = Database()
connector.connect()
connector.query()
