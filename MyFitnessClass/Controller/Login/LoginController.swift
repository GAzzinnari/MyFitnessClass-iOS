//
//  LoginController.swift
//  MyFitnessClass
//
//  Created by Gabriel on 7/15/20.
//  Copyright © 2020 Example. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    // MARK: Constants, enums
    private enum ViewConstants {
        static let username = "Username"
        static let password = "Password"
        static let loginButton = "Login"
    }
    
    // MARK: Outlets
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViews()
    }

    // MARK: Private methods
    private func setupViews() {
        self.usernameLabel.text = ViewConstants.username
        self.passwordLabel.text = ViewConstants.password
        self.loginButton.setTitle(ViewConstants.loginButton, for: .normal)
    }
}
