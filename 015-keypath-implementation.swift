import Foundation

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

var john = Person(name: "John", age: 23)
var keyPath: KeyPath<Person, String> = \Person.name
var name = john[keyPath: keyPath]
print(name) // John
