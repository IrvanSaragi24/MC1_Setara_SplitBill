//
//  SpendingView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 03/04/23.
//

import SwiftUI

struct SpendingView: View {
    
    @State var listNameTable: [ListName]
    
    @State private var showingAlert = false
    @State var changeView: Bool = false
    
    var body: some View {
        
        return Group {
            if changeView{
                withAnimation{
                    HomeView()
                }
                
            }else{
                VStack {
                    HStack{
                        Spacer()
                        Image("Triangle")
                    }
                    .padding(.bottom, -20)
                    VStack(alignment: .leading)
                    {
                        Text("Expenses")
                            .padding(.top, 20.0)
                            .padding(.leading, 15.0)
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                        List {
                            
                            
                            ForEach(0..<listNameTable.count) { i in
                                if listNameTable[i].isChecked {
                                    
                                    let participantss = SharedPreferences.shared.getParitcipant(name: listNameTable[i].name)
                                    
                                    HStack() {
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.black)
                                            .padding(.trailing,10)
                                        VStack() {
                                            Text("\(listNameTable[i].name)")
                                                .lineLimit(2)
                                                .frame(alignment: .leading)
                                        }
                                        .padding(.leading, 20)
                                        .padding(.trailing, 50)
                                        
                                        Text("Rp \(participantss!.total)")
                                            .frame(width : 100, height: 100, alignment: .leading)
                                    }
                                    
                                    
                                }
                                
                            }
                            .scrollContentBackground(.hidden)
                            
                        }
                        .frame(width: 360, height: 470)
                        .background(Color.gray)
                        .cornerRadius(25)
                        .padding(.bottom, 80)
                        
                        
                        
                        Button{
                            showingAlert = true
                        } label: {
                            Text("Finish")
                                .fontWeight(.bold)
                                .font(.system(.subheadline, design: .rounded))
                                .frame(width: 200)
                                .padding()
                                .foregroundColor(.white)
                                .background(CustomColor.myColor)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                        }
                        .padding(.leading, 70)
                        .alert(isPresented: $showingAlert) {
                            Alert(
                                title: Text("Are you sure ?"),
                                message: Text("After this the transaction will be deleted"),
                                primaryButton: .destructive(Text("OK")) {
                                    self.changeView.toggle()
                                    //                                print("Delete the whole transaction")
                                    //
                                    //                                HomeView()
                                },
                                secondaryButton: .cancel()
                            )
                        }
                        
                        
                        
                        //                Button{
                        //                    showingAlert = true
                        //                } label: {
                        //                    Text("Finish")
                        //                        .fontWeight(.bold)
                        //                        .font(.system(.subheadline, design: .rounded))
                        //                        .frame(width: 200)
                        //                        .padding()
                        //                        .foregroundColor(.white)
                        //                        .background(CustomColor.myColor)
                        //                        .cornerRadius(20)
                        //                        .shadow(radius: 5)
                        //                }
                        //                .padding(.leading, 70)
                        //                .alert(isPresented: $showingAlert) {
                        //                    Alert(
                        //                        title: Text("Are you sure ?"),
                        //                        message: Text("After this the transaction will be deleted"),
                        //                        primaryButton: .destructive(Text("OK")) {
                        //                            print("Delete the whole transaction")
                        //
                        //                        },
                        //                        secondaryButton: .cancel()
                        //                    )
                        //                }
                        Image("Oval")
                            .padding(.horizontal, -17)
                            .padding(.top, -60)
                        
                    }
                    
                }
            }
        }
        
        
    }
    
    struct SpendingView_Previews: PreviewProvider {
        static var previews: some View {
            SpendingView(listNameTable: [ListName(name: "Me", isChecked: true, food: [], total: 100)])
        }
    }
}
