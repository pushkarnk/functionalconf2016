
import Foundation


func memoize<T: Hashable, U>(_ fn: @escaping ((T)->U, T) -> U) -> (T) -> U {
    var cache = [T:U]()
    var result: ((T)->U)!
    result = {
        val in
        if cache.index(forKey: val) == nil {
            cache[val] = fn(result, val)
        }
        return cache[val]!
    }
    return result
}

let fibonacci: (Int) -> Int = memoize {
    fibonacci, n in 
        switch n {
        case 0, 1: return n
        default: return fibonacci(n-1) + fibonacci(n-2)
        }
}

func getTimeInMillis() -> Double {
    return Double(Date().timeIntervalSince1970 * 1000)
}

let s = getTimeInMillis()
let x = fibonacci(80)
let e = getTimeInMillis()

print("Calculated \(x) in \(e - s) millseconds")
