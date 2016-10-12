enum Gender {
    case Male
    case Female
}

class Customer {
    let name: String
    let gender: Gender
    let age: Int
    let totalPurchases: Double

    public init(name: String, gender: Gender, age: Int, totalPurchases: Double) {
        self.name = name
        self.gender = gender
        self.age = age
        self.totalPurchases = totalPurchases
    }
    
    public func giftCouponAmount(calculator: (Double) -> Double) -> Double {
        return calculator(totalPurchases)
    }
}

class Sales {
    let totalProfit: Double
    
    public init(profit: Double) {
        totalProfit = profit
    }

    func generateCalculator() -> (Double) -> Double {
        let incentive = 200.00
        return { total in (self.totalProfit - 5) * total/100 + incentive }
    }
}

let sales = Sales(profit: 13.7)
let customer = Customer(name: "Virat", gender: Gender.Male, age: 26, totalPurchases: 40324)
let giftCoupon = customer.giftCouponAmount(calculator: sales.generateCalculator())
print(giftCoupon)
