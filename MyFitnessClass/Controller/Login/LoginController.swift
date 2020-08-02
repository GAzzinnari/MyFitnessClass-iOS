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
    private enum LoginConstants {
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
    
    // MARK: Properties
    weak var windowDelegate: WindowDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupViews()
    }
    
    // MARK: Actions
    @IBAction func didTapLoginButton(_ sender: Any) {
        #warning("TODO: Add real logic when working on login feature")
        let dashboardController = DashboardController()
        self.windowDelegate?.setRootController(dashboardController)
    }
    
    // MARK: Private methods
    private func setupViews() {
        self.usernameLabel.text = LoginConstants.username
        self.passwordLabel.text = LoginConstants.password
        self.loginButton.setTitle(LoginConstants.loginButton, for: .normal)
    }
}
