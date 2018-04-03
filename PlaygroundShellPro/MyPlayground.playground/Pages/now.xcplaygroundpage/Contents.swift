func quickSort_theFunctional(_ array: [Int]) -> [Int] {

    guard array.count > 1 else {
        return array
    }

    let (pivot, rest) = (array.first!, array.dropFirst())

    let lessThan = rest.filter{ $0 < pivot }
    let greaterThanOrEqual = rest.filter{ $0 >= pivot }

    return quickSort_theFunctional(lessThan) + ([pivot] as [Int]) + quickSort_theFunctional(greaterThanOrEqual)
}

// Sorted
quickSort_theFunctional([Int]()) == [Int]()
quickSort_theFunctional([7]) == [7]
quickSort_theFunctional([1, 1, 2, 3, 5, 8, 13]) == [1, 1, 2, 3, 5, 8, 13]

// Nearly Sorted
quickSort_theFunctional([1, 2, 7, 3, 5, 13, 8]) == [1,  2, 3, 5,7, 8, 13]

// Reversed
quickSort_theFunctional([1, 1, 2, 3, 5, 8, 13].reversed()) == [1, 1, 2, 3, 5, 8, 13]

// Shuffled
//quickSort_theFunctional([1, 1, 2, 3, 5, 8, 13].shuffled()) == [1, 1, 2, 3, 5, 8, 13]
