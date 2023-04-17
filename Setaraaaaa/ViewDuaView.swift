//
//  ViewDuaView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 31/03/23.
//

import SwiftUI

struct ViewDuaView: View {
    @State private var currentPage = 0
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        
        VStack() {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(0..<3) { i in
                        
                        Image("welcomescreen\(i+1)")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
            }
            .frame(width: 353, height: 353)
            VStack(spacing: 10) {
                Text("Help you to split bill with your friend")
                    .fontWeight(.medium)
                
                
                HStack(spacing: 4) {
                    ForEach(0..<3) {i in
                        CustomColor.myColor
                            .opacity(i == currentPage ? 1 : 0.5)
                            .frame(width:i == currentPage ? 80 : 47, height: 8)
                            .cornerRadius(10)
                    }.padding(.trailing, 2)
                }
                
                
                Text("Sometimes Split bill is challenging if you don't know how to do it. Here we give you some how to do it fairly")
                    .frame(alignment:Alignment.trailing)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal)
                    .padding()
                
                TabView(selection: $currentPage) {
                    ForEach(0..<3) {i in
                        
                        if(i != 2) {
                            Button{
                                print(currentPage+=1)
                            }
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 230,height: 60)
                                    .shadow(radius: 5)
                                
                                    .foregroundColor(CustomColor.myColor)
                                Text("Next")
                                    .font(.system(.title2, design: .rounded))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                        }
                            
                        .padding(.top, 70)
                        } else {
                            
                            Button(action:{
                                self.isOnboarding = false
                            },label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 230,height: 60)
                                        .shadow(radius: 5)
                                    
                                        .foregroundColor(CustomColor.myColor)
                                    Text("Get Started")
                                        .font(.system(.title2, design: .rounded))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    
                                }
                                .padding(.top ,70)
                            })
                            
                        }
                    }
                    
                }
            }
            
        }
        
        
    }
    
    
}



struct ViewDuaView_Previews: PreviewProvider {
    static var previews: some View {
        ViewDuaView()
    }
}

struct CustomColor {
    static let myColor = Color("BasicYellow")
}
