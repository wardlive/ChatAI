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
                Image("splashImage")
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 150.0))
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
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
