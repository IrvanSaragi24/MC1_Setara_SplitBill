//
//  SetaraaaaaApp.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 31/03/23.
//

import SwiftUI

@main
struct SetaraaaaaApp: App {
    @AppStorage("isOnboarding") var isOnboarding = true
    private var isActive: Bool = true
    
    var body: some Scene {
        WindowGroup {

            if isOnboarding {
                SplashScreenView()
            } else {
                HomeView()
                
            }
            
        }
    }
}
