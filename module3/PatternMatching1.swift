enum List {
    indirect case Cons(Int, List)
    case Nil
    
    public var description: String {
        switch self {
        case .Cons(let x, let xs) : return "(Cons \(x) \(xs.description))"
        case .Nil: return "Nil"
        }
    }
}

func toList(_ array: Array<Int>) -> List {
    switch array {
    case let x where x.isEmpty: return .Nil
    default: return .Cons(array.first!, toList(array.dropFirst()))
    }
}

func toList(_ slice: ArraySlice<Int>) -> List {
    return toList(Array(slice))
}

func toArray(_ list: List) -> [Int] {
    switch list {
        case .Cons(let x, let xs): return [x] + toArray(xs)
        case .Nil: return []
    }
}

let l = toList(Array(1...10))
print(l.description)

let a = toArray(l)
print(a)
