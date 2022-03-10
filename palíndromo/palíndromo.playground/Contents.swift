import UIKit

let alunos = ["Ana",
              "Breno",
              "Iui",
              "Isabella",
              "Hanah",
              "Oto"]

func isPalindrome (_ name: String) -> Bool {
    let upperCaseName = name.uppercased()
    let revertedName = String(upperCaseName.reversed())
    if upperCaseName == revertedName {
        return true
    } else {
        return false
    }
}
print("Os alunos com nomes palíndromos são:")
print(alunos.filter { isPalindrome($0)})
