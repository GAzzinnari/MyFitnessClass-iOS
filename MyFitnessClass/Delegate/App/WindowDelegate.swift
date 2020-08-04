//
//  WindowDelegate.swift
//  MyFitnessClass
//
//  Created by Gabriel on 7/16/20.
//  Copyright © 2020 Example. All rights reserved.
//

import Foundation
import UIKit

/** Class(es) conforming to this protocol will handle events related to AppDelegate's window */
protocol WindowDelegate: AnyObject {
    /**
     Call this method to set a UIViewController as new root for window.
     */
    func setRootController(_ viewController: UIViewController)
}
