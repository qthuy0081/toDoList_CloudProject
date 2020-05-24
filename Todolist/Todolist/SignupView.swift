//
//  SignupView.swift
//  Todolist
//
//  Created by Dinh Quoc Thuy on 5/24/20.
//  Copyright © 2020 Dinh Quoc Thuy. All rights reserved.
//

import SwiftUI

struct SignupView: View {
    @State var height:CGFloat = 0
    
    var body: some View {
        NavigationView {
            
            ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : (self.height == 0 ? .init() : .vertical) , showsIndicators: false) {
                Text("Sign up")
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
