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
        
    @Published var token: Token?
        
    private let senseApiFetcher: SenseApiFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(senseApiFetcher: SenseApiFetchable) {
        self.senseApiFetcher = senseApiFetcher
    }
    
}

extension LoginViewModel {
    
    func loginAttempt(credentials: Login) {
        senseApiFetcher.login(credentials: credentials)
            .map{ data in data.token }
            .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
            guard let self = self else { return }
            
            switch value {
            case .failure:
                self.token = nil
            case .finished:
                break
            }
        }, receiveValue: { [weak self] token in
            guard let self = self else { return }
            self.token = Token(token: token)
        })
        .store(in: &disposables)
    }
    
}
