import Foundation

class Person: Comparable {
    var name: String
    var age: String
    
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.name.hashValue < rhs.name.hashValue
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name.hashValue == rhs.name.hashValue
    }
}

struct User: Comparable {
    var name: String
    var age: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        return lhs.name.hashValue < rhs.name.hashValue
    }
}
