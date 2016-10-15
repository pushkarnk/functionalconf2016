//Optional is a monad
func half(_ x: Int) -> Int? {
    return x % 2 == 0 ? x/2 : nil
}

let x: Int? = 1024
print(x.flatMap(half).flatMap(half).flatMap(half).flatMap(half).flatMap(half))

let y: Int? = nil
print(y.flatMap(half))

let z: Int? = 300
print(z.flatMap(half).flatMap(half).flatMap(half).flatMap(half))



//Array is a monad
func genArray(x: Int) -> [Int] {
    guard x > 0 else { return [] }
    return Array(0...x)
}

let x0 = [1].flatMap(genArray)
print(x0)

let x1 = [0,1].flatMap(genArray).flatMap(genArray).flatMap(genArray).flatMap(genArray)
print(x1)

let x2 = [].flatMap(genArray)
print(x2)
