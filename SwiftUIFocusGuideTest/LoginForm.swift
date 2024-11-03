//
//  LoginForm.swift
//  SwiftUIFocusGuideTest
//
//  Created by Arbab Nawaz on 11/3/24.
//
import SwiftUI

struct LoginForm: View {
    enum Field: Hashable {
        case username
        case password
        case address
    }
    
    @State private var username = ""
    @State private var password = ""
    @State private var address = ""
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack {
            

            Form {
                TextField("Address", text: $address, axis: .vertical)
                    .lineLimit(2) // expandeble vertically but limited to 2 lines
                    .lineLimit(2...) //occupy at least the number of lines you specified and then grow as the content grow.
                    .focused($focusedField, equals: .username)
                
                TextField("Username", text: $username)
                    .focused($focusedField, equals: .username)
                
                
                SecureField("Password", text: $password)
                    .focused($focusedField, equals: .password)
                
                
                
                Button("Sign In") {
                    if username.isEmpty {
                        focusedField = .username
                    } else if password.isEmpty {
                        focusedField = .password
                    } else {
                        //handleLogin(username, password)
                    }
                }
            }
            VStack {
                ZStack {
                    Text("Compositing Group")
                        .foregroundColor(.black)
                        .padding(20)
                        .background(Color.red)
                    Text("Compositing Group")
                        .blur(radius: 2)
                        .offset(x: -1, y: 1)
                }
                .font(.largeTitle)
                .compositingGroup()
            }
            .background(Color.green)
            .opacity(0.75)
        }
        
        .scrollDismissesKeyboard(.interactively)
        .navigationBarTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.navigationStack)
        .onAppear {
            focusedField = .username
        }
    }
}

