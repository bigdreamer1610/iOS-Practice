import Foundation

// Observer
protocol Observer : AnyObject {
    func update(state: Bool)
}

// Subject
protocol Subject {
    func attach(observer: Observer)
    func detach(observer: Observer)
    func notifyAllObservers()
}

//Concrete Observer
class FrontDoor : Observer {
    func update(state: Bool) {
        if state {
            print("First door has been opened")
        } else {
            print("First door has been closed")
        }
    }
}

class BackDoor : Observer {
    func update(state: Bool) {
        if state {
            print("Back door has been closed")
        } else {
            print("Back door has been opened")
        }
    }
}

//concrete subject
class DoorSubject : Subject {
    
    var state: Bool = false
    
    private lazy var observers = [Observer]()
    
    func attach(observer: Observer) {
        observers.append(observer)
        print("Subject: Attach a new observer")
    }
    
    func detach(observer: Observer) {
        if let idx = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: idx)
            print("Subject: Detached an observer.\n")
        }
    }
    
    func notifyAllObservers() {
        print("Subject: Notify all observers...")
        observers.forEach({$0.update(state: self.state)})
    }
    
    func doCommon() {
        print("changing state, let's see what's next ...")
        state = Bool.random()
        print("new state: \(state)")
        notifyAllObservers()
    }
}


let door = DoorSubject()

let frontDoor = FrontDoor()
let backDoor = BackDoor()

door.attach(observer: frontDoor)
door.attach(observer: backDoor)

door.doCommon()

door.detach(observer: backDoor)
door.doCommon()
