//
//  FirstViewController.swift
//  DebugDemo
//
//  Created by Thuy Nguyen on 23/05/2021.
//

import UIKit

class Parent {
    var name: String
    var child: Child?
    
    init(name: String, child: Child? = nil) {
        self.name = name
        self.child = child
    }
}

class Child {
    var name: String
    var parent:  Parent
    
    init(name: String, parent: Parent) {
        self.name = name
        self.parent = parent
    }
}

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let parent = Parent(name: "John", child: nil)
        let child = Child(name: "Nick", parent: parent)
        
        parent.child = child
    }
    
    @IBAction func clickNext(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.name = "Halston is a genius"
        vc.age = 12
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}
