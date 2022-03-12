import UIKit

func doubleInPlace(number:inout Int) {// declaring number as an inout para//meter
    print(number)
    number *= 2
    print(number)
}

var myNum = 10
doubleInPlace(number: &myNum)
print("variável \(myNum)")

//variável que pode ser alterada
var myAge: Int = 23

//variável com valor constante
let myName: String = "Lucas de Castro Souza"

//Criação de array
var techSkills: [String] = ["React.JS",
                            "JavaScript",
                            "TypeScript",
                            "Swift",
                            "HTML",
                            "CSS/SASS"]

