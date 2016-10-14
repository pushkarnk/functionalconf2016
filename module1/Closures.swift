binaryOperator<T>(_ x: T, _ y: T, _ op: (T, T) -> T) -> T {
    return op(x, y)
}

let x0 = binaryOperator(19, 2, { (a: Int, b: Int) in return a * b })
print(x0)

let x1 = binaryOperator(12.1, 91.3, { a, b in a + b })
print(x1)

let x2 = binaryOperator("Hello ", "World") {
    a, b in a + b
}
print(x2)

let x3 = binaryOperator("Functional", "Conf") { $0 + $1 }
print(x3)

let x4 = binaryOperator("FunctionalConf", "2016", +)
print(x4)
rint(z3)
