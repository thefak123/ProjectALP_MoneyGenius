//
//  setUpScreen.swift
//  ProjectALP_MoneyGenius
//
//  Created by MacBook Pro on 28/05/23.
//

import SwiftUI

struct SetUpScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: createAccount) {
                Text("Create Account")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
    
    func createAccount() {
        guard !username.isEmpty else {
            showAlert(message: "Please enter a username.")
            return
        }
        
        guard !password.isEmpty else {
            showAlert(message: "Please enter a password.")
            return
        }
        
        guard !email.isEmpty else {
            showAlert(message: "Please enter an email address.")
            return
        }
        
        // Perform account setup logic
        // ...
        
        showAlert(message: "Account setup successful!")
        
        // Clear the fields after successful account setup
        username = ""
        password = ""
        email = ""
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Account Setup", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

struct setUpContentView: View {
    var body: some View {
        SetUpScreen()
    }
}

struct setUpContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
