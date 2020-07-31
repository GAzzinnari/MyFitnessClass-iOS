//
//  BarlessNavigationController.swift
//  MyFitnessClass
//
//  Created by Gabriel on 7/16/20.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation
import UIKit

class BarlessNavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        // Make plain UIViewController root, to be able to popToRoot and dismiss
        // all custom controllers
        let emptyController = UIViewController()
        emptyController.view.backgroundColor = .white
        super.init(rootViewController: emptyController)
        self.pushViewController(rootViewController, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        self.navigationBar.isHidden = true
    }
}
