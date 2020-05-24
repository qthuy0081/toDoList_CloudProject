//
//  ContentView.swift
//  Todolist
//
//  Created by Dinh Quoc Thuy on 5/23/20.
//  Copyright © 2020 Dinh Quoc Thuy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State var email = ""
    @State var password = ""
    @State var rem = false
    @State var height: CGFloat = 0
    var body: some View {
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : (self.height == 0 ? .init() : .vertical) , showsIndicators: false) {
            ZStack {
                
                ZStack {
                        
                        VStack {
                            Image("logo2").resizable().frame(width: 420, height: 300, alignment:.center)
                            VStack(alignment: .leading) {
                                
                                Text("Login").font(.title).fontWeight(.bold)
                                
                                Text("Username").fontWeight(.bold).padding(.top,20)
                                                    
                                VStack {

                                    TextField("",text: self.$email)
                                    
                                    Rectangle()
                                        .fill(self.email == "" ? Color.black.opacity(0.08) : Color("Color")).frame(height:2)
                                    
                                }
                                
                                Text("Password").fontWeight(.bold).padding(.top,20)
                                                                        
                                VStack {

                                    SecureField("",text: self.$password)
                                                        
                                    Rectangle()
                                        .fill(self.password == "" ? Color.black.opacity(0.08) : Color("Color")).frame( height: 2)
                                }
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                    }, label: {
                                        Text("Forget password?").fontWeight(.bold).foregroundColor(Color("Color"))
                                    })
                                }.padding(.top).padding(.bottom, 10)
                                
                                
                            }
                            .padding()
                            .foregroundColor(Color.black.opacity(0.7))
                            .background(Color.white)
                            .overlay(Rectangle().stroke(Color.black.opacity(0.03), lineWidth: 1).shadow(radius: 4))
                            .padding(.horizontal).padding(.top,-25)
                            
                            //Bottom
                            HStack(alignment: .center) {
                                    
                                Button(action: {
                                    
                                }, label: {
                                    Text("SIGNIN").fontWeight(.bold).foregroundColor(Color.white).padding(.vertical).padding(.horizontal, 35).background(LinearGradient(gradient:.init(colors: [Color("Color1"),Color("Color")]) , startPoint: .leading, endPoint: .trailing))
                                    .cornerRadius(5)
                                })
                            }.padding(.top).padding(.horizontal)
                            
                            HStack {
                                
                                Rectangle()
                                    .fill(Color.black.opacity(0.05))
                                    .frame(width: 100, height: 2)
                                
                                Text("Social Login")
                                    .foregroundColor(Color.black.opacity(0.7)).fontWeight(.bold)
                                
                                Rectangle()
                                    .fill(Color.black.opacity(0.05))
                                    .frame(width: 100, height: 2)
                            }.padding(.top)
                            
                            HStack(spacing: 30) {
                                Button(action: {
                                    
                                }, label: {
                                    Image("google").renderingMode(.original).resizable().frame(width: 45, height: 45)
                                    
                                })
                                Button(action: {
                                                        
                                }, label: {
                                                        
                                    Image("fb").renderingMode(.original).resizable().frame(width: 35, height: 35)
                                })
                            }
                            
                            HStack {
                                
                                Text("New User?").foregroundColor(Color.black.opacity(0.7)).fontWeight(.bold)
                                
                                Button(action: {
                                    
                                }, label: {
                                    Text("SIGNUP").foregroundColor(Color("Color")).fontWeight(.bold)
                                })
                            }.padding(.top,30).padding(.bottom)
                            
                            Spacer()
                        }
                }
            }.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
        }
        .padding(.bottom,height)
        .background(Color.black.opacity(0.03)).edgesIgnoringSafeArea(.all).edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            NotificationCenter .default.addObserver(forName:  UIResponder.keyboardDidShowNotification, object: nil, queue: .main) {
                (not) in
                let data = not.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as!  NSValue
                let height = data.cgRectValue.height - (UIApplication.shared.windows.first?.safeAreaInsets.bottom)!
                print(height)
                self.height = height
            }
            NotificationCenter .default.addObserver(forName:  UIResponder.keyboardDidHideNotification, object: nil, queue: .main) {
                (_) in
               
                print("hidden")
                self.height = 0
            }
        })
        
      
    }
}
