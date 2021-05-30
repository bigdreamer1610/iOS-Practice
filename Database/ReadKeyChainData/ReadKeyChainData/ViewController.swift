//
//  ViewController.swift
//  ReadKeyChainData
//
//  Created by Thuy Nguyen on 30/05/2021.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {

    @IBOutlet weak var lbData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        // Do any additional setup after loading the view.
    }
    
    func initData() {
        let keychain = KeychainSwift()
        keychain.accessGroup = "test.KeychainDemo"
        if let email = keychain.get("email"),
           let password = keychain.get("password") {
            lbData.text = "\(email) - \(password)"
        }
    }

    @IBAction func clickRead(_ sender: Any) {
        
    }
    
}

