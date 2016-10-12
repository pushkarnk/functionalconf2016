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
   
    public init(_ name: String, _ gender: Gender, _ age: Int, _ totalPurchases: Int ) {
        self.name = name
        self.gender = gender
        self.age = age
        self.totalPurchases = totalPurchases
    }
}

let customers = [ Customer("Priya", .Female, 35, 12000), Customer("Nathan", .Male, 60, 13234),
                  Customer("Rahat", .Male, 61, 8900), Customer("Lakshmi", .Female, 69, 12123),
                  Customer("Chulbul", .Male, 39, 5600), Customer("Rajni", .Female, 61, 3000) ]

//names of all senior citizens
let namesOfSeniors = customers.filter { $0.age >= 60}
                              .map { $0.name }

namesOfSeniors.forEach { print($0) }

//number of women
let numberOfWomen = customers.filter { $0.gender == .Female }.count

//average age of women
let averageAgeWomen = customers.filter { $0.gender == .Female } 
                               .map { $0.age }
                               .reduce(0, +) / numberOfWomen
                           
print(averageAgeWomen)

//average purchases of women
let totalPurchaseWomen = customers.filter { $0.gender == .Female }
                                  .map { $0.totalPurchases }
                                  .reduce (0, +) / numberOfWomen
print(totalPurchaseWomen)
     
