//
//  ViewController.swift
//  SQLiteDemo
//
//  Created by Thuy Nguyen on 25/05/2021.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    let db = try! Connection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectDB()
        // Do any additional setup after loading the view.
    }
    
    func connectDB() {
        let db = try! Connection()
        
        db.trace { element in
            print(element)
        }
        
        let users = Table("users")
        
        let id = Expression<Int64>("id")
        let email = Expression<String>("email")
        let name = Expression<String?>("name")
        
        try! db.run(users.create{ t in
            t.column(id, primaryKey: true)
            t.column(email, unique: true, check: email.like("%@%"))
            t.column(name)
        })
        
        let rowid = try! db.run(users.insert(email <- "hello@gmail.com"))
        
        
        let alice = users.filter(id == rowid)
        
        for user in try! db.prepare(users) {
            print("id: \(user[id]), email: \(user[email])")
        }
        
        let emails = VirtualTable("emails")
    }


}

