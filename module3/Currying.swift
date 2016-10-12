class Customer {
    let name: String
    let age: Int
    let gender: Gender
   
    public init(_ name: String, _ age: Int, _ gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }
}

enum Gender {
    case male
    case female
}


let customers = [Customer("Pinky", 34, .female), Customer("Kiran", 29, .male), Customer("Josh", 39, .male), Customer("Nasser", 42, .male), 
                 Customer("Priya", 30, .female), Customer("Deepa", 43, .female)]

//list of female customers with Ms. title
let females = customers.filter { $0.gender == .female }
                       .map { "Ms. " + $0.name }
females.forEach { print($0) }

//list of male customers with Mr. title
let males = customers.filter { $0.gender == .male }
                       .map { "Mr. " + $0.name }
males.forEach { print($0) }


func addTitle(_ title: String, _ name: String) -> String {
    return "\(title) \(name)"
}

//another approach
let females0 = customers.filter { $0.gender == .female }
                       .map { addTitle("Ms. ", $0.name) }
print(females0)

let males0 = customers.filter { $0.gender == .male }
                      .map { addTitle("Mr. ", $0.name) }
print(males0)

//one more approach
func titleMs(_ name: String) -> String {
    return "Ms. " + name
}

func titleMr(_ name: String) -> String {
    return "Mr. " + name
}

let females1 = customers.filter { $0.gender == .female }
                        .map { titleMs($0.name) }
print(females1)

let males1 = customers.filter { $0.gender == .male }
                      .map { titleMr($0.name) }
print(males1)


//the currying approach
func addTitle(_ title: String) -> (String) -> String {
    return { name in title + name }
}

let titleMs = addTitle("Ms.")
let titleMr = addTitle("Mr.")

print(customers.filter { $0.gender == .female }.map { titleMs($0.name) })
print(customers.filter { $0.gender == .male }.map {titleMr($0.name) })
