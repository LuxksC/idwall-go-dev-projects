import UIKit

class Stack {
    var myStack: [Any] = [];
    
    func addElement (_ element: Any) {
        myStack.append(element)
    }
    
    func removeLastElement() {
        myStack.popLast()
    }
    
    func removeAllElements() {
        myStack.removeAll()
    }

    func showLastElement() -> Any {
        guard let topElement = myStack.last else { return "Empty stack"}
        return topElement
    }
    
    func showStack() {
        print(myStack)
    }
    
}

var myFirstStack = Stack()
print(myFirstStack.showLastElement())
myFirstStack.addElement("First")
myFirstStack.showStack()
print(myFirstStack.showLastElement())
myFirstStack.addElement("Second")
myFirstStack.addElement("Third")
myFirstStack.showStack()
myFirstStack.removeLastElement()
myFirstStack.showStack()
myFirstStack.removeAllElements()
myFirstStack.showStack()
myFirstStack.removeAllElements()
myFirstStack.showStack()
