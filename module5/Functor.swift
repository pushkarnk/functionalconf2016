//Optional is a functor
class Customer {
    let name: String
    let age: Int

    public init? (_ name: String, _ age: Int) {
        guard age < 115 else { return nil }
        self.name = name
        self.age = age
    }
}

let customer = Customer("Harshad", 20)

//not cool
if let c = customer {
    print(c.name)
}

//cool
let name = customer.map { $0.name }
print(name)

let customer1 = Customer("Rustom", 120)
let name1 = customer1.map { $0.name }
print(name1)

//find the length of the name
let len0 = customer.map { $0.name }
                   .map { $0.characters.count }
print(len0)

let len1 = customer1.map { $0.name }
                    .map { $0.characters.count }
print(len1)
