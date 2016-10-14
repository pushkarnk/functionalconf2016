let nouns = ["book", "clock", "computer", "chair", "pen"]

//add indefinite article aka 'a' and print
nouns.map { "a " + $0 }
     .forEach { print($0)}
     

//add definite article aka 'the' and print
nouns.map { "the " + $0 }
     .forEach { print($0) }
     

func prefix(with article: String, str: String ) -> String {
    return article + " " +  str
}

nouns.map { prefix(with: "a", str: $0) }
     .forEach { print($0) }
     

nouns.map { prefix(with: "the", str: $0) }
     .forEach { print($0) }
     
//still not readable

//so much duplication
func prefixIndefinite(_ str: String) -> String {
    return "a " + str
}

func prefixDefinite(_ str: String) -> String {
    return "the " + str
}

nouns.map { prefixIndefinite($0) }.forEach { print($0) }
nouns.map { prefixDefinite($0) }.forEach { print($0) }

//curried solution
func prefix(with article: String) -> (String) -> String {
    return { str in article + " " + str }
}

let prefixIndefinite0 = prefix(with: "a ")
let prefixDefinite0 = prefix(with: "the ")

nouns.map(prefixIndefinite0).forEach { print($0) }
nouns.map(prefixDefinite0).forEach { print($0) }
