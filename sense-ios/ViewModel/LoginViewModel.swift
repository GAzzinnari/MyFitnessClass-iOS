//
//  LoginViewModel.swift
//  sense-ios
//
//  Created by Mobile on 10/26/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
        
    @Published var login: Login = Login(email: "", password: "")
    @Published var token: Token = Token(token: "")
        
    private let senseApiFetcher: SenseApiFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(senseApiFetcher: SenseApiFetchable,
         scheduler: DispatchQueue = DispatchQueue(label: "LoginViewModel")) {
        self.senseApiFetcher = senseApiFetcher
        $login
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: loginAttempt(credentials:))
            .store(in: &disposables)
    }
    
}

extension LoginViewModel {
    
    func loginAttempt(credentials: Login) {
        senseApiFetcher.login(credentials: credentials)
            .map { data in data }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                
                switch value {
                case .failure:
                    self.token = Token(token: "")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] token in
                guard let self = self else { return }
                
                self.token = token
            })
            .store(in: &disposables)
    }
    
}
