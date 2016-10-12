//Introduction to simple closures

func binaryOperator<T>(x: T, y: T, op: (T, T) -> T) -> T {
    return op(x, y)
}


let x = binaryOperator(x: 100, y: 100, op: {a, b in a + b})
let y = binaryOperator(x: 3.14, y: 2.71, op: {a, b in a * b})
let z = binaryOperator(x: "Hello, ", y: "World!", op: {a, b in a + b})

print(x)
print(y)
print(z)


//trailing closures
let x1 = binaryOperator(x: 100, y: 200) { a, b in
    a + b
}

let y1 = binaryOperator(x: 3.14, y: 2.71) { x, y in
    x * y
}

let z1 = binaryOperator(x: "Hello, ", y: "World!") { u, v in
    u + v
}

print(x1)
print(y1)
print(z1)

//short hand
let x2 = binaryOperator(x: 100, y: 200) { $0 + $1 }
let y2 = binaryOperator(x: 3.14, y: 2.71) { $0 * $1 }
let z2 = binaryOperator(x: "Hello, ", y: "World!") { $0 + $1 }
print(x2)
print(y2)
print(z2)


//Operator method
let x3 = binaryOperator(x: 100, y: 200, op: +)
let y3 = binaryOperator(x: 3.14, y: 2.71, op: *)
let z3 = binaryOperator(x: "Hello, ", y: "World!", op: +)
print(x3)
print(y3)
print(z3)
