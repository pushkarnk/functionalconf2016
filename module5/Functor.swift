//Optionals and Arrays are functors
func stringLength(_ str: String?) -> Int? {
    return str.map { $0.characters.count }
}

func stringLengths(_ strs: [String]) -> [Int] {
    return strs.map { $0.characters.count }
}


print(stringLength(nil))
print(stringLength("fresh"))

print(stringLengths([]))
print(stringLengths(["functionalConf", "2016"]))
