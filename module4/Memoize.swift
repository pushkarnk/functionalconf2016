import Foundation

func getCurrentMillis() -> Int64 {
    return Int64(Date().timeIntervalSince1970 * 1000)
}

func memoize<T:Hashable, U>(_ fn : @escaping ((T)->U, T) -> U) -> (T) -> U {
  var cache = [T:U]()
  var result: ((T)->U)!
  result = {
    (val : T) -> U in
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

let start1 =  getCurrentMillis()
print(fibonacci(40))
let end1 = getCurrentMillis()
print(end1 - start1)

