//build this incrementally
func isPrime(_ x: Int) -> Bool {
    return x > 1 && (2..<x).filter { x % $0 == 0 }.count == 0
}


//build this incrementally
func sumOfSquaresOfPrimes(upto n: Int) -> Int {
    return (2...n).filter(isPrime)
                  .map { $0 * $0 }
                  .reduce(0, +)
}

let s1 = sumOfSquaresOfPrimes(upto: 5)
print(s1)

