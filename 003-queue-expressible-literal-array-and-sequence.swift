import Foundation

protocol QueueProtocol: Sequence, ExpressibleByArrayLiteral where Self.T == Self.ArrayLiteralElement, Self.Element == Self.Iterator.Element {
    associatedtype T
    
    subscript(index: Int) -> T {
        get set
    }
    
    func push(item: T) -> T
    func pop() -> T?
    func peek() -> T?
    func clear()
}

final class Queue<Element>: QueueProtocol {
    private var array: [Element] = []
    typealias T = Element
    
    init(arrayLiteral elements: Element...) {
        self.array = elements
    }
    
    subscript(index: Int) -> Element {
        get {
            return self.array[index]
        }
        set {
            self.array[index] = newValue
        }
    }
    
    func push(item: Element) -> Element {
        self.array.append(item)
        return item
    }
    
    func pop() -> Element? {
        return self.array.removeFirst()
    }
    
    func peek() -> Element? {
        return self.array.first
    }
    
    func clear() {
        return self.array.removeAll()
    }
    
    func makeIterator() -> IndexingIterator<[T]> {
        return array.makeIterator()
    }
}

let queue: Queue<Int> = [1, 2, 3, 4, 6, 7, 8, 9, 10]

print(queue.peek())
queue.pop()

for item in queue {
    print(item)
}

//Optional(1)
//2
//3
//4
//6
//7
//8
//9
//10
