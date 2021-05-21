//
//  ChooseColorViewController.swift
//  NSNotificationCenterDemo
//
//  Created by Thuy Nguyen on 21/05/2021.
//

import UIKit

// NotificationCenter.default is where all notifications are posted to and are observed from
// Each notification must have a unique way to identify themselves, which would then represent the channel we are tuning in to if we continue with our analogy

class ChooseColorViewController: UIViewController {

    @IBOutlet weak var lbColor: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNotification()
    }
    
    // listen to their designated channels and perform actions based on each one
    func setUpNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(setPink(noti:)), name: .pink, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(setOrange(noti:)), name: .orange, object: nil)
    }
    
    // post notifcation to the target channel
    @IBAction func clickPink(_ sender: Any) {
        NotificationCenter.default.post(name: .pink, object: nil)
    }

    @IBAction func clickOrange(_ sender: Any) {
        NotificationCenter.default.post(name: .orange, object: nil)
    }
    
    @objc func setPink(noti: NSNotification) {
        lbColor.text = "Pink"
    }
    
    @objc func setOrange(noti: NSNotification) {
        lbColor.text = "Orange"
    }
    
    @IBAction func clickNext(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "KVODemoViewController") as! KVODemoViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

// an extension on Notification.Name and added two static properties with the name of each channel
extension NSNotification.Name {
    static let pink = Notification.Name("Pink")
    static let orange = Notification.Name("Orange")
}
