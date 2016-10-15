ion Optional {
    func apply<U>(_ fn: ((Wrapped) -> U)?) -> U? {
        switch fn {
            case .some(let f): return self.map(f)
            case .none: return .none
        }
    }
}

func getAdder(_ a: Int) -> ((Int) -> Int)? {
    guard a % 2 == 0 else { return .none }
    return { $0 + a }
}

let x: Int? = 10
let s = x.apply(getAdder(2))
print(s)

let y: Int? = nil
let s1 = y.apply(getAdder(10))
print(s1)

let z: Int? = 20
let s2 = z.apply(getAdder(11))
print(s2)

//!!!
func curriedAddition(_ x: Int) -> (Int) -> Int {
    return { $0 + x }
}

let w = x.map(curriedAddition)
print(z.apply(w))


