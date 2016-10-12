import Foundation

enum Gender {
    case Male
    case Female
}

class Customer {
    let name: String
    let gender: Gender
    let age: Int
    let totalPurchases: Int
    let hoursPerDay: Int

    public init(_ name: String, _ gender: Gender, _ age: Int, _ totalPurchases: Int, _ hoursPerDay: Int  ) {
        self.name = name
        self.gender = gender
        self.age = age
        self.totalPurchases = totalPurchases
        self.hoursPerDay = hoursPerDay
    }
}

let customers = [ Customer("Priya", .Female, 35, 12000, 1), Customer("Nathan", .Male, 60, 13234, 3),
                  Customer("Rahat", .Male, 61, 8900, 2), Customer("Lakshmi", .Female, 69, 12123, 2),
                  Customer("Chulbul", .Male, 39, 5600, 5), Customer("Rajni", .Female, 61, 3000, 4) ]


let femaleSeniors = customers.lazy.filter { $0.age >= 60 }
                                  .filter { $0.gender == .Female }

//total time spent by female senior citizens online
let t = femaleSeniors.map { $0.hoursPerDay }
                     .reduce (0, +)
print(t)


//total purchases of female senior citizens who spent more than 2 hours
let p = femaleSeniors.filter { $0.hoursPerDay > 2 }
                     .map { $0.totalPurchases }
                     .reduce(0, +)
print(p)


//helpers
func isSenior(_ age: Int) -> Bool {
    print("isSenior")
    return age >= 60
}

func isWoman(_ gender: Gender) -> Bool {
    print("isGender")
    return gender == .Female
}

func moreThanTwoHours(_ hours: Int) -> Bool {
    print("moreThanTwoHours")
    return hours > 2
}


////total purchases of female senior citizens who spent more than 2 hours
let p1 = customers.lazy.filter { isSenior($0.age) }
                  .filter { isWoman($0.gender) }
                  .filter { moreThanTwoHours($0.hoursPerDay) }
                  .map { $0.totalPurchases }
                  .reduce(0, +)
print(p1)
