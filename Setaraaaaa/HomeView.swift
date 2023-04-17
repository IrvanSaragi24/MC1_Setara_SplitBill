//
//  HomeView.swift
//  Setaraaaaa
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 04/04/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var checkState: [Bool] = [false, false]
    @State private var btnActive: Bool = true
    @State var checkCount: Int = 0
    @State var nameParticipant: [String] = ["Me"]
    @State private var navigated = false
    @State var listName: [ListName] = [
        ListName(name: "Me", isChecked: false, food: [], total: 0),
]
    
    var body: some View {
        
        
        VStack {
            
            NavigationStack {
                VStack() {
                    List {
                        
                        
                        ForEach(0..<nameParticipant.count, id:\.self) { index in
                            HStack {
                                Button(action:
                                        {
                                    
                                    
                                    //1. Save state
                                    self.checkState[index] = !self.checkState[index]
                                    
                                    self.listName[index].isChecked = !self.listName[index].isChecked
                                    
                                    print("State : \(self.checkState)")
                                    
                                    let checkNameDatabase = SharedPreferences.shared.getParitcipant(name: nameParticipant[index])
                                    
                                    if checkNameDatabase == nil {
                                        SharedPreferences.shared.add(participant: ListName(name: "\(nameParticipant[index])", isChecked: false, food: [], total: 0))
                                        
                                        print("Berhasil menambahkan \(nameParticipant[index])")
                                    } else {
                                        
                                        print("nama ini udah ada")
                                    }
                                    
                                    
                                    
                                    if(checkState[index] == true) {
                                        checkCount += 1
                                        
                                    } else {
                                        checkCount -= 1
                                    }
                                    
                                    if checkCount < 2 {
                                        
                                        self.btnActive = true
                                        
                                    }else  {
                                        self.btnActive = false
                                    }
                                    
                                    
                                })
                                {
                                    HStack( spacing: 10) {
                                        
                                        
                                        Text("\(nameParticipant[index])")
                                        
                                            .lineLimit(1)
                                            .frame(width: 200, alignment: .leading)
                                            
                                        
                                        
                                        Rectangle()
                                            .fill(self.checkState[index] ? CustomColor.myColor : Color.gray)
                                            .frame(width:20, height:20, alignment: .center)
                                            .cornerRadius(5)
                                            .padding(.leading, 120)
                                        
                                    }
                                    
                                    .swipeActions(edge: .trailing, allowsFullSwipe: false, content: {
                                        
                                        Button {
                                            
                                            nameParticipant.remove(at: index)
    
                                        } label: {
                                            Image(systemName: "trash")
                                        } .tint(.red)
                                        
                                    }
                                    )
                            
                                    
                                }
                                
                                .foregroundColor(Color.black)
                                
                                
                                
                            }
                        }
                    }
                    NavigationLink(destination: TablePlateView(listNameTable: listName), isActive: $navigated) {
                        Button{
                            navigated = true
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
                    .padding()
                    .padding(.bottom, 80)
                    }
                    .disabled(btnActive)
                }.background(Image("BackGround"))
                
                
                .listStyle(.plain)
                .navigationTitle("Participants")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        
                                Button(
                                    action: {
                                        
                                        
                                        alertTF(title: "Add Participants Name", message: "Enter the names of the person in your group", hintText: "Name", primaryTitle: "Cancel", secondaryTitle: "Add") { text in
                                            
                                            nameParticipant.append(text)
                                            checkState.append(false)
                                            
                                            listName.append(ListName(name: text, isChecked: false, food: [], total: 0))
                                            
                                            
                                        } secondaryAction: {
                                            print("Cancelled")
                                        }
        
                                        
                                    }, label: {
                                        Image(systemName: "plus")
                                    }
                                )
                    }
                }
            }
            .accentColor(CustomColor.myColor)
        }
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



extension View {
    func alertTF(title: String, message: String, hintText: String, primaryTitle: String, secondaryTitle: String, primaryAction: @escaping (String)->(), secondaryAction: @escaping ()->()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = hintText
        }
        
        
        alert.addAction(.init(title: primaryTitle, style: .cancel, handler: { _ in secondaryAction()}))
        
        alert.addAction(.init(title: secondaryTitle, style: .default, handler: { _ in
            
            if let text = alert.textFields?[0].text {
                primaryAction(text)
            }
            else {
                primaryAction("")
            }
            
        }))
        
        rootController().present(alert, animated: true, completion: nil)
    }
    
    func rootController()->UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return.init()
        }
        
        return root
    }
    
}
