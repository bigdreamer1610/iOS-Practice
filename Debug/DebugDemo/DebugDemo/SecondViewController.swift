//
//  SecondViewController.swift
//  DebugDemo
//
//  Created by Thuy Nguyen on 23/05/2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    var name: String?
    var age: Int?
    
    @IBOutlet weak var lbHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = self.name {
            lbHello.text = name
        }
        if let age = self.age {
            print("age: \(age)")
        }
        // Do any additional setup after loading the view.
    }
}
