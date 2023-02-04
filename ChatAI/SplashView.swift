//
//  SplashView.swift
//  ChatAI
//
//  Created by Pavel Neprin on 2/4/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool
    
    var body: some View {
        ZStack {
            if self .isActive {
                ContentView()
            } else {
                ZStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color("AccentColor")/*@END_MENU_TOKEN@*/)
                    
                    Image("appstore")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 110)
                        .cornerRadius(20)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.spring()) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(isActive: false)
    }
}
