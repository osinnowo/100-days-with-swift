var mixedArray: [Any?] = [1, 2, "3", 4.0, nil, true, "", "5.0"]

var resultArray: [Int] = mixedArray.compactMap { item in
    if let item = item as? String {
        
        if let intValue = Int(item) {
            return intValue
        }
        
        if let doubleValue = Double(item) {
            return Int(doubleValue)
        }
    }
    
    if let item = item as? Int {
        return item
    }
    
    if let item = item as? Double {
        return Int(item)
    }
    
    return nil
}

print(resultArray)
