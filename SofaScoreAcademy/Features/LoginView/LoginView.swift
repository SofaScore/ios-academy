//
//  LoginView.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 05/05/2021.
//

import SwiftUI

struct LoginView: View {

    @StateObject private var viewModel: LoginViewModel
    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            if !viewModel.isLoggingIn {
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                TextField("Username", text:$username)
                    .padding()
                    .background(Color.background)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.background)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(Color.red)
                        .padding()
                }
                Button(action: {
                    viewModel.login(username: username, password: password)
                }) {
                    Text("LOGIN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }
            } else {
                ProgressView()
            }
        }.padding()
    }

    init() {
        _viewModel = StateObject(wrappedValue: LoginViewModel.shared)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        return LoginView()
    }
}
