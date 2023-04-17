//
//  TreatView.swift
//  MC1_ScreenList
//
//  Created by Irvan P. Saragi on 03/04/23.
//

import SwiftUI

struct TreatView: View {
    let data = ["Irvan","wira","Edi", "Pattric", "Yari"]
    @State private var selectedData = "Irvan"
    @State private var TreatAmmount : String = ""
    @State var TreatDeposit : String
    var body: some View {
        VStack(){
            VStack(alignment: .leading){
                Text("\(TreatDeposit)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .padding(.bottom, 100)
            }
            HStack{
                Text("IDR")
                TextField("Ammount..",
                          text: $TreatAmmount)
                
                .multilineTextAlignment(.center)
                .disableAutocorrection(true)
                .font(.title3)
                
            }
            .padding(.horizontal, 50)
            Divider()
            
            

            Picker(selection: $selectedData, label: Text("")) {
                ForEach(data, id: \.self){item in
                    Text(item)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .compositingGroup()
            .clipped()
            .fontWeight(.semibold)
            Spacer()
            Button {
                print("add amount deposit or treat")
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 100,height: 60)
                        .shadow(radius: 5)
                    
                        .foregroundColor(CustomColor.myColor)
                    Text("Add")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 70)
        }
        .background(Image("BackGround"))
        
    }
}

struct TreatView_Previews: PreviewProvider {
    static var previews: some View {
        TreatView(TreatDeposit: "")
    }
}
