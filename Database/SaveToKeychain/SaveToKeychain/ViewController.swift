//
//  ViewController.swift
//  SaveToKeychain
//
//  Created by Thuy Nguyen on 30/05/2021.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickSave(_ sender: Any) {
        guard let email = tfEmail.text,
              let password = tfPassword.text else {
            return
        }
        
        let keychain = KeychainSwift()
        keychain.accessGroup = "test.KeychainDemo"
        keychain.set(email, forKey: "email")
        keychain.set(password, forKey: "password")
        
        //navigate
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReadViewController") as! ReadViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

