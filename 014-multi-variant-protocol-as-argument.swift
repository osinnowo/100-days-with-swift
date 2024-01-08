
protocol Storage {
    associatedtype Element: Numeric
    func initialize()
}

class LocalStorage<T: Numeric>: Storage {
    typealias Element = T
    func initialize() { }
}

class RemoteStorage<R: Numeric>: Storage {
    typealias Element = R
    func initialize() { }
}

func storageImplementation(storage: (any Storage)?) {
    storage?.initialize()
}

storageImplementation(storage: LocalStorage<Int>())