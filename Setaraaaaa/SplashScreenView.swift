//
//  SplashScreenView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 11/04/23.
//

import SwiftUI



struct SplashScreenView: View {
    @AppStorage("isOnboarding") var isOnboarding = true
    
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            
            if self.isActive {
                ViewDuaView()
            } else {
                
                Image("splashScreenTiga")
                    .resizable()
                    .frame(width: 300, height: 300)
                
            }
            
            
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    
                    self.isActive = true
                    
                }
            }
        }
    }
    
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreenView()
        }
    }
    
    
}
