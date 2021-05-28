//
//  AddNewViewController.swift
//  SQLiteDemo
//
//  Created by Thuy Nguyen on 26/05/2021.
//

import UIKit

protocol AddNewDelegate : class {
    func addNewStudent(newName: String)
}

class AddNewViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    
    weak var delegate: AddNewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickAdd(_ sender: Any) {
        guard let name = tfName.text, !name.isEmpty else {
            return
        }
        delegate?.addNewStudent(newName: name)
        //delegate?.addNewStudent(name: name)
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
