import Foundation

class Base {
    class func exampleClassMethod() {
        print("BaseClass - exampleClassMethod")
    }
}

class Derived: Base {
    override class func exampleClassMethod() {
        print("Subclass - exampleClassMethod")
    }
}
