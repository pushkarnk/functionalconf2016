//traverse a square
func visit(_ s: Int, _ x: Int, _ y: Int) {
    print("(\(x),\(y))")
    switch (x, y) {
    case (0, 0): return
    case (1..<s, 0): visit(s, x+1, 0)
    case (s, 0..<s): visit(s, x, y+1)
    case (1...s, s): visit(s, x-1, y) 
    case (0, 1...s): visit(s, x, y-1) 
    default: print("error")
    }
}

visit(6, 1, 0) 

