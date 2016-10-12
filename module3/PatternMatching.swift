//traverse a square
func visit(_ s: Int, _ x: Int, _ y: Int) {
    print("(\(x),\(y))")
    switch (x, y) {
    case (0, 0): return
    case (x, 0) where x < s: visit(s, x+1, 0)
    case (s, y) where y < s: visit(s, x, y+1)
    case (x, s) where x > 0: visit(s, x-1, y) 
    case (0, y) where y > 0: visit(s, x, y-1) 
    default: print("error")
    }
}

visit(6, 1, 0) 




//length of an array without using a loop, or without using count
func lengthOfArray<T>(_ array: ArraySlice<T>) -> Int {
    switch(array.first, array.dropFirst()) {
    case (.none, _): return 0
    case (_, let tail): return 1 + lengthOfArray(tail)
    }
}
