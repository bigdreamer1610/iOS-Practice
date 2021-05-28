//
//  DisplayViewController.swift
//  SQLiteDemo
//
//  Created by Thuy Nguyen on 28/05/2021.
//

import UIKit
import Realm
import RealmSwift

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

    let realm = try! Realm()
    let myCat = Cat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()

        // Do any additional setup after loading the view.
    }
    func initData() {
        myCat.name = "Monie"
        myCat.weight = 5
        
        print("my cat is: \(myCat.name)")
        
        let kitties = realm.objects(Cat.self).filter("weight < 6")
//        kitties.count
        
        try! realm.write({
            realm.add(myCat)
        })
        
        print(kitties.count)
        
        realm.objects(Cat.self).fil
        
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
