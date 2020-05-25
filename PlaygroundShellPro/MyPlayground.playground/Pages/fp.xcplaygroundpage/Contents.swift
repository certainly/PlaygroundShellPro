
import Foundation

enum RideCategory: String, CustomStringConvertible {
    case family
    case kids
    case thrill
    case scary
    case relaxing
    case water

    var description: String {
        return rawValue
    }
}

typealias Minutes = Double
struct Ride: CustomStringConvertible {
    let name: String
    let categories: Set<RideCategory>
    let waitTime: Minutes

    var description: String {
        return "⚡️Ride(name: \"\(name)\", waitTime: \(waitTime), categories: \(categories))"
    }
}

let parkRides = [
    Ride(name: "Raging Rapids", categories: [.family, .thrill, .water], waitTime: 45.0),
    Ride(name: "Crazy Funhouse", categories: [.family], waitTime: 10.0),
    Ride(name: "Spinning Tea Cups", categories: [.kids], waitTime: 15.0),
    Ride(name: "Spooky Hollow", categories: [.scary], waitTime: 30.0),
    Ride(name: "Thunder Coaster", categories: [.family, .thrill], waitTime: 60.0),
    Ride(name: "Grand Carousel", categories: [.family, .kids], waitTime: 15.0),
    Ride(name: "Bumper Boats", categories: [.family, .water], waitTime: 25.0),
    Ride(name: "Mountain Railroad", categories: [.family, .relaxing], waitTime: 0.0)
]


func sortedNamesImp(of rides: [Ride]) -> [String] {

    // 1
    var sortedRides = rides
    var key: Ride

    // 2
    for i in (0..<sortedRides.count) {
        key = sortedRides[i]

        // 3
        for j in stride(from: i, to: -1, by: -1) {
            if key.name.localizedCompare(sortedRides[j].name) == .orderedAscending {
                sortedRides.remove(at: j + 1)
                sortedRides.insert(key, at: j)
            }
        }
    }

    // 4
    var sortedNames: [String] = []
    for ride in sortedRides {
        sortedNames.append(ride.name)
    }

    return sortedNames
}

let sortedNames1 = sortedNamesImp(of: parkRides)


func testSortedNames(_ names: [String]) {
    let expected = ["Bumper Boats",
                    "Crazy Funhouse",
                    "Grand Carousel",
                    "Mountain Railroad",
                    "Raging Rapids",
                    "Spinning Tea Cups",
                    "Spooky Hollow",
                    "Thunder Coaster"]
    assert(names == expected)
    print("✅ test sorted names = PASS\n-")
}

print(sortedNames1)
testSortedNames(sortedNames1)

var originalNames: [String] = []
for ride in parkRides {
    originalNames.append(ride.name)
}

func testOriginalNameOrder(_ names: [String]) {
    let expected = ["Raging Rapids",
                    "Crazy Funhouse",
                    "Spinning Tea Cups",
                    "Spooky Hollow",
                    "Thunder Coaster",
                    "Grand Carousel",
                    "Bumper Boats",
                    "Mountain Railroad"]
    assert(names == expected)
    print("✅ test original name order = PASS\n-")
}

print(originalNames)
testOriginalNameOrder(originalNames)


//parkRides[0] = Ride(name: "Functional Programming",
//                    categories: [.thrill], waitTime: 5.0)


//func sortedNames(of rides: [Ride]) -> [String] {
//    var sortedRides = rides
//    var key: Ride
//
//    // 1
//    for i in (0..<sortedRides.count) {
//        key = sortedRides[i]
//
//        // 2
//        for j in stride(from: i, to: -1, by: -1) {
//            if key.name.localizedCompare(sortedRides[j].name) == .orderedAscending {
//                sortedRides.remove(at: j + 1)
//                sortedRides.insert(key, at: j)
//            }
//        }
//    }
//
//
//    // 3
//    var sortedNames = [String]()
//    for ride in sortedRides {
//        sortedNames.append(ride.name)
//    }
//
//    return sortedNames
//}

//print(sortedNames(of: parkRides))
//
//var originalNames = [String]()
//for ride in parkRides {
//    originalNames.append(ride.name)
//}
//
//print(originalNames)


//func waitTimeIsShort(ride: Ride) -> Bool {
//    return ride.waitTime < 15.0
//}
//var shortWaitTimeRides = parkRides.filter{ $0.waitTime < 15.0 }
////print(shortWaitTimeRides)
//
//
//
//let rideNames = parkRides.map { $0.name }
////print(rideNames)
////print(rideNames.sorted(by: <))
//
func sortedNames(of rides: [Ride]) -> [String] {
    let rideNames = parkRides.map { $0.name }
    return rideNames.sorted(by: <)
}
//
print(sortedNames(of: parkRides))
//
//
//let totalWaitTime = parkRides.reduce(0.0) { (total, ride) in total + ride.waitTime }
////print(totalWaitTime)
//
func filter(for category: RideCategory) -> ([Ride]) -> [Ride] {
    return { (rides: [Ride]) in
        rides.filter { $0.categories.contains(category) }
    }
}
//
extension Ride: Comparable {
    static func <(lhs: Ride, rhs: Ride) -> Bool {
        return lhs.waitTime < rhs.waitTime
    }

    static func ==(lhs: Ride, rhs: Ride) -> Bool {
        return lhs.name == rhs.name
    }
}
extension Array where Element: Comparable {
    func quickSorted() -> [Element] {
        if self.count > 1 {
            let (pivot, remaining) = (self[0], dropFirst())
            let lhs = remaining.filter { $0 <= pivot }
            let rhs = remaining.filter { $0 > pivot }
            return lhs.quickSorted()  + [pivot] + rhs.quickSorted()
        }
        return self
    }
}

let quickSortedRides = parkRides.quickSorted()
print("\(quickSortedRides)")

print("=======================")
func testSortedByWaitRides(_ rides: [Ride]) {
    let expected = rides.sorted(by:  { $0.waitTime < $1.waitTime })
    assert(rides == expected, "unexpected order")
    print("✅ test sorted by wait time = PASS\n-")
}

testSortedByWaitRides(quickSortedRides)
//
let kidRideFilter = filter(for: .kids)
print(kidRideFilter(parkRides))

func ridesWithWaitTimeUnder(_ waitTime: Minutes, from rides: [Ride]) -> [Ride] {
    return rides.filter { $0.waitTime < waitTime }
}
//var shortWaitRides = ridesWithWaitTimeUnder(15, from: parkRides)
//assert(shortWaitRides.count == 2, "Count of short wait rides should be 2")

let shortWaitRides = ridesWithWaitTimeUnder(15, from: parkRides)

func testShortWaitRides(_ testFilter:(Minutes, [Ride]) -> [Ride]) {
    let limit = Minutes(15)
    let result = testFilter(limit, parkRides)
    print("rides with wait less than 15 minutes:\n\(result)")
    let names = result.map { $0.name }.sorted(by: <)
    let expected = ["Crazy Funhouse",
                    "Mountain Railroad"]
    assert(names == expected)
    print("✅ test rides with wait time under 15 = PASS\n-")
}

testShortWaitRides(ridesWithWaitTimeUnder(_:from:))


var ridesOfInterest: [Ride] = []
for ride in parkRides where ride.waitTime < 20 {
    for category in ride.categories where category == .family {
        ridesOfInterest.append(ride)
        break
    }
}

let sortedRidesOfInterest1 = ridesOfInterest.quickSorted()
print(sortedRidesOfInterest1)

func testSortedRidesOfInterest(_ rides: [Ride]) {
    let names = rides.map { $0.name }.sorted(by: <)
    let expected = ["Crazy Funhouse",
                    "Grand Carousel",
                    "Mountain Railroad"]
    assert(names == expected)
    print("✅ test rides of interest = PASS\n-")
}

testSortedRidesOfInterest(sortedRidesOfInterest1)

let sortedRidesOfInterest2 = parkRides
    .filter { $0.categories.contains(.family) && $0.waitTime < 20 }
    .sorted(by: <)

testSortedRidesOfInterest(sortedRidesOfInterest2)
