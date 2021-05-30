//
//  ReadViewController.swift
//  SaveToKeychain
//
//  Created by Thuy Nguyen on 30/05/2021.
//

import UIKit

class ReadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickRead(_ sender: Any) {
        guard let appURL = URL(string: "ReadKeychainDemo://") else { return }
        if UIApplication.shared.canOpenURL(appURL) {
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        }
    }
    

}
