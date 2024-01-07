import Foundation

let nsArray: NSArray = [1, 2, 3] // Immutable, Non-generic & Reference Type (Objective-C)
let nsMutableArray: NSMutableArray = [1, 2, 3] // Mutable, Non-generic & Reference Type (Objective-C)
let immutableArray: [Int] = [1, 2, 3, 4] // Immutable, Generic & Value Type (Swift)
var mutableArray: [Int] = [1, 2, 3, 4] // Mutable, Generic & Value Type (Swift)

nsMutableArray.add(4)

for item in nsMutableArray {
    print(item)
}
