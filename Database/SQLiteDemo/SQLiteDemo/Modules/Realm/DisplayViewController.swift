//
//  DisplayViewController.swift
//  SQLiteDemo
//
//  Created by Thuy Nguyen on 28/05/2021.
//

import UIKit
import Realm
import RealmSwift

enum Keys: String {
    case name = "Name"
    case age = "Age"
    case employee = "Employee"
}
// try NSCoding
class Employee : NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // encode an object
    func encode(with coder: NSCoder) {
        // bind value supplied as the first param to a key
        coder.encode(name, forKey: Keys.name.rawValue)
        coder.encode(age, forKey: Keys.age.rawValue)
    }
    
    // decode the data to instanitiate a new object
    required convenience init?(coder aDecoder: NSCoder) {
        // read the value from the NSCoder object provided from a specified key
        let name = aDecoder.decodeObject(forKey: Keys.name.rawValue) as! String
        let age = aDecoder.decodeInteger(forKey: Keys.age.rawValue)
        self.init(name: name, age: age)
    }
    
}

class Cat: Object {
    @objc dynamic var name = ""
    @objc dynamic var weight = 0
}

class Person : Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 10
    let cat = List<Cat>()
}

class DisplayViewController: UIViewController {

    let userDefaults = UserDefaults.standard
    let realm = try! Realm()
    let myCat = Cat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        saveNSCodingtoUserDefaults()
        // Do any additional setup after loading the view.
    }
    
    func saveNSCodingtoUserDefaults() {
        let employee = Employee(name: "Thuy", age: 20)
        let encodedData: Data = try! NSKeyedArchiver.archivedData(withRootObject: employee, requiringSecureCoding: true)
        userDefaults.set(encodedData, forKey: Keys.employee.rawValue)
        userDefaults.synchronize()
    }
    
    func initData() {
        if let savedEmmp = userDefaults.object(forKey: Keys.employee.rawValue) as? Data {
            if let decodedEmployee = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedEmmp) as? Employee {
                print("found: \(decodedEmployee.name) - \(decodedEmployee.age)")
            }
        } else {
            saveNSCodingtoUserDefaults()
            print("saved to userdefaults")
        }
        
        myCat.name = "Monie"
        myCat.weight = 5
        
        print("my cat is: \(myCat.name)")
        
        let kitties = realm.objects(Cat.self).filter("weight < 6")
//        kitties.count
        
        try! realm.write({
            realm.add(myCat)
        })
        
        print(kitties.count)
        
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                if let theCat = realm.objects(Cat.self).filter("weight = 4").first {
                    try! realm.write({
                        theCat.weight = 10
                    })
                }
//                let theCat = realm.objects(Cat.self).filter("weight = 4").first
//                try! realm.write({
//                    theCat!.
//                })
            }
        }
    }

}
