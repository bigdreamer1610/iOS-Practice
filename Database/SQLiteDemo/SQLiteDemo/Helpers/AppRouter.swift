//
//  AppRouter.swift
//  SQLiteDemo
//
//  Created by Thuy Nguyen on 26/05/2021.
//

import Foundation
import UIKit

enum RouterType {
    case menu
    case add
    case list
    case delete
}

extension RouterType {
    func getVc() -> UIViewController {
        switch self {
        case .menu:
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else {
                return UIViewController()
            }
            return vc
        case .list:
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else {
                return UIViewController()
            }
            return vc
        case .add:
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddNewViewController") as? AddNewViewController else {
                return UIViewController()
            }
            return vc
        case .delete:
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DeleteViewController") as? DeleteViewController else {
                return UIViewController()
            }
            return vc
        }
    }
}
