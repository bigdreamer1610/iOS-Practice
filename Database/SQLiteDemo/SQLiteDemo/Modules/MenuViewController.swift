//
//  MenuViewController.swift
//  SQLiteDemo
//
//  Created by Thuy Nguyen on 26/05/2021.
//

import UIKit
import SQLite

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        // Do any additional setup after loading the view.
    }
    
    func initData() {
        setUpDatabase()
    }
    
    func setUpDatabase() {
        try! db.run(students.create { t in
            t.column(myId, primaryKey: true)
            t.column(name)
        })
    }
    
    
    @IBAction func clickAdd(_ sender: Any) {
        let vc = RouterType.add.getVc() as! AddNewViewController
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func clickList(_ sender: Any) {
        let vc = RouterType.list.getVc()
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func clickDelete(_ sender: Any) {
        let vc = RouterType.delete.getVc()
        self.present(vc, animated: true, completion: nil)
    }
}

extension MenuViewController : AddNewDelegate {
    func addNewStudent(newName: String) {
        let id = try! db.run(students.insert(name <- newName))
        
        for student in try! db.prepare(students) {
//            print("\(student)")
            print("id: \(student[myId]), name: \(student[name])")
            //print("id: \(student[id]), name: \(student[name])")
        }
    }
}
