import Foundation



protocol MakingSoupDelegate : AnyObject {
    func didSoupDone()
}

class Parents {
    weak var delegate: MakingSoupDelegate?
    
    init(delegate: MakingSoupDelegate) {
        self.delegate = delegate
    }
    
    func makeDinner() {
        print("done making vege")
        print("done making barbecues")
        delegate?.didSoupDone()
        print("let's have dinner")
    }
}

class Child : MakingSoupDelegate {
    func didSoupDone() {
        print("done making soups by child")
    }
}

let child = Child()
let parents = Parents(delegate: child)

parents.makeDinner()
