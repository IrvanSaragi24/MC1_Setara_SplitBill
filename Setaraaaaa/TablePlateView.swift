//
//  TablePlateView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 04/04/23.
//

import SwiftUI


struct TablePlateView: View {
    
    @State var listNameTable: [ListName]
    
    @State private var navigated = false
    @State private var isDeposit = false
    @State private var showingSheet = false
    var body: some View {
        
        
        VStack {
            HStack{
                Spacer()
                Image("Triangle")
            }
            HStack(spacing : 50) {
//                NavigationStack {
//                    NavigationLink(destination: TreatView(TreatDeposit: "Deposit")) {
//                        VStack {
//                            Image("BankPiggy")
//                                .resizable()
//                                .frame(width: 100, height: 100)
//                            Text("Deposit")
//                                .font(.system(size: 20, weight: .medium))
//                                .frame(alignment: .trailing)
//                        }
//
//                    }
//
//                }
                NavigationStack {
                    NavigationLink(destination: TreatView(TreatDeposit: "Treat")) {
                        VStack(spacing: 10) {
        
                            Image("Cake")
                                .resizable()
                                .frame(width: 130, height: 130)
                                
                            Text("Treat")
                                .font(.system(size: 20, weight: .medium))
                                .frame(alignment: .trailing)
                        }
                    }
                }
            }
            .padding(.bottom, 50)
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 25) {
                    
                    ForEach(0..<listNameTable.count) { i in
                        if listNameTable[i].isChecked {
                            
                            let totalSum = SharedPreferences.shared.getParitcipant(name: listNameTable[i].name)
                            
                            ZStack(alignment: .bottom) {
                                
                                Color(.gray)
                                    .frame(height: 400 / 3)
                                    .cornerRadius(20)
                                    .opacity(0.6)
                                
//                                let itemView = ItemView()
                                
                                VStack(alignment: .center) {
                                    NavigationLink (destination: ItemView(participant: listNameTable[i], listNameTable: $listNameTable, index: i)) {
                                        
                                        Image("Piring")
                                            .resizable()
                                            .frame(width: 150, height: 150)
                                            .scaledToFit()
                                        
                                        
                                    }
                                    
                                    Text(listNameTable[i].name)
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                    
                                    Text("Rp \(totalSum?.total ?? 0) ")
                                
                                    
                                }
                                .padding(.horizontal, 20)
                                .padding(.vertical, 25)
                                
                            }
                        }
                        
                    }
                    
                }.padding(.bottom, 40)
            }
            
            NavigationLink (destination: SpendingView(listNameTable: listNameTable), isActive: $navigated) {
                
                
                Button(
                    action: {
                        self.navigated = true

                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 230,height: 60)
                                .shadow(radius: 5)
                                .foregroundColor(CustomColor.myColor)
                            Text("Result")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                )
            }
            HStack{
                Image("Oval")
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Plates")
                    .font(.title2.bold())
                    .accessibilityAddTraits(.isHeader)
            }
        }
        
    }
}


struct TablePlateView_Previews: PreviewProvider {
    static var previews: some View {
        TablePlateView(listNameTable: [ListName(name: "Me", isChecked: false, food: [FoodList(itemName: "Tarempa", itemPrice: 10000)], total: 0)])
    }
}


struct Traktiran : View{
    var body: some View{
        Text("Hello World")
    }
}
