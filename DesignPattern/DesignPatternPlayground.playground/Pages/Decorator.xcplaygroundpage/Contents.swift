import Foundation

// Component
protocol HumanComponent {
    func eat()
    func sleep()
    func die()
    func doOthers()
}

//Concrete Component
class HumanConcreteComponent : HumanComponent {
    
    func eat() {
        print("Human eats")
    }
    
    func sleep() {
        print("Human sleeps")
    }
    
    func die() {
        print("Human dies eventually")
    }
    
    func doOthers() {
        //nothing
    }
}

// Decorator
class HumanDecorator : HumanComponent {
    
    var human: HumanComponent
    
    init(human: HumanComponent) {
        self.human = human
    }
    
    func sleep() {
        human.sleep()
    }
    
    func die() {
        human.die()
    }
    
    func doOthers() {
        human.doOthers()
    }
    
    func eat() {
        human.eat()
    }
}

//Concrete Decorator
class Coder : HumanDecorator {
    func code() {
        print("Coder codes everyday")
    }
    
    func fixBug() {
        print("Life is all about fixing bugs for coders :(")
    }
    
    override func doOthers() {
        code()
        fixBug()
    }
}

class Tester : HumanDecorator {
    
    func testProgram() {
        print("Tester finds bugs in the program")
    }
    
    func report() {
        print("Testers reports bug to the manager")
    }
    
    override func doOthers() {
        testProgram()
        report()
    }
}

let human = HumanConcreteComponent()
human.doOthers()
human.eat()

let coder = Coder(human: human)
coder.doOthers()
