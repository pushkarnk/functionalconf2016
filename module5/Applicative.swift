class Sales {
    let profit: Int
   
    public init(_ profit: Int) { 
        self.profit = profit
    }
 
    public func giftAmountFn() -> ((Int) -> Int)? {
       guard profit > 5 else { return nil }
       return { total in (self.profit/2)*total/100 } 
    }
}

class Customer {
    let name: String
    let totalPurchases: Int
    let age: Int 

    public init?(_ name: String, _ totalPurchases: Int, _ age: Int) {
        guard age < 75 else { return nil } 
        self.age = age
        self.name = name
        self.totalPurchases = totalPurchases
    }
}

let sales = Sales(10)
let customer0 = Customer("Suresh", 30000, 32)


//the bad way
var giftAmount = 0
let gfunc = sales.giftAmountFn()
if let giftCalc = gfunc {
    if let c = customer0 {
        giftAmount = giftCalc(c.totalPurchases)
     }
}
print(giftAmount)


//the cooler way
extension Optional<T> {
    public func apply`



