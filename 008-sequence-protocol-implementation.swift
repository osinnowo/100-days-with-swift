struct MySequence: Sequence {
    typealias Element = Int
    
    let elements: [Int]
    
    func makeIterator() -> Array<Int>.Iterator {
        return elements.makeIterator()
    }
}

let sequence = MySequence(elements: [1, 2, 3, 4, 5])

for element in sequence {
    print(element)
}