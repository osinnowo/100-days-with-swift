import Foundation

var months: [String] = ["Jan", "Feb", "Mar", "Apr"]

var monthReverse: ReversedCollection<[String]> = months.reversed()

print(monthReverse) // ReversedCollection<Array<String>>(_base: ["Jan", "Feb", "Mar", "Apr"])

for month in monthReverse {
    print(month) //Apr Mar Feb Jan
}

