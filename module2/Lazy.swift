func cubePlusDouble(x: Int) -> Int {
    return x * x * x +  2 * x
}

let x = Array(1...100).lazy
                      .map(cubePlusDouble)
                      .filter { $0 % 2 == 1 }
                      
print(x.prefix(10).reduce(0, +))
print(x.suffix(12).reduce(1, +))
print(x.first!)

//23...43
let p = x.prefix(43)
let s = p.suffix(20).reversed()
print(s.first!)
