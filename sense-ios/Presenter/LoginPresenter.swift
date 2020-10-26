//
//  LoginPresenter.swift
//  sense-ios
//
//  Created by Mobile on 10/23/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import Foundation
import Combine

class LoginPresenter: ObservableObject {
    
    private let interactor: LoginInteractor
    
    init(interactor: LoginInteractor)  {
        self.interactor = interactor
    }
    
}
