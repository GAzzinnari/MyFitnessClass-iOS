//
//  ContentView.swift
//  sense-ios
//
//  Created by Mobile on 10/23/20.
//  Copyright © 2020 Aledev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack() {
            
            Image("sense-logo")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Rectangle())
                .shadow(radius: 10)
                .padding([.top, .bottom], 50)
            
            VStack(alignment: .leading, spacing: 15) {
                
                TextField("Email", text: self.$email)
                    .padding()
                    .cornerRadius(10.0)
                    .background(Color(.white))
                    .opacity(0.9)
                    .font(.custom("Avenir", size: 18))
                    .frame(width: 340, height: 50, alignment: .center)
                
                SecureField("Password", text: self.$password)
                    .padding()
                    .cornerRadius(10.0)
                    .background(Color(.white))
                    .opacity(0.9)
                    .font(.custom("Avenir", size: 18))
                    .frame(width: 340, height: 50, alignment: .center)
                
            }
            .padding([.leading, .trailing], 15.0)
            
            Button(action:{}) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding([.top, .bottom], 20)
                    .frame(width: 300, height: 50)
                    .background(/*@START_MENU_TOKEN@*/Color(red: 0.632, green: 0.85, blue: 0.278)/*@END_MENU_TOKEN@*/)
                    .cornerRadius(5.0)
            }
            .padding()
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .topLeading)
        .background(Color(.black))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
