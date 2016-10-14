func binaryOperator<T>(_ x: T, _ y: T, _ op: (T, T) -> T) -> T {
    return op(x, y)
}

func adder() -> (Int, Int) -> Int {
    return { a, b in a + b }
}

func concater() -> (String, String) -> String {
    return { $0 + $1 }
}


let x1 = binaryOperator(100, 200, adder())
print(x1)

let x2 = binaryOperator("Hello, ", "World!", concater() )
print(x2)
