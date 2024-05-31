//
//  ContentView.swift
//  iExpense
//
//  Created by Hitesh Madaan on 23/05/24.
//

import Observation
import SwiftUI

struct SecondView:View{
    
    @Environment(\.dismiss) var dismiss
    var text:String
    
    init(_ text: String) {
        self.text = text
    }
    var body: some View{
        
        Text("\(text)")
        Button("Dismiss"){
            dismiss()
        }
    }
}

@Observable
class User{
    var firstName="Hitesh"
    var lastName="Madaan"
}
struct ContentView: View {
    @State private var numbers=[Int]()
    @State private var currentNumber=1
    @State private var user=User()
    @State private var showingsheet=false
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(numbers,id: \.self){n in
                        Text("Row \(n)")
                    }.onDelete(perform:removeRow)
                }
//                Text("The name is \(user.firstName) \(user.lastName) .")
//                
//                TextField("First Name", text:  $user.firstName)
//                TextField("Last Name", text: $user.lastName)
                
                Button("Show Sheets")
                {
                    numbers.append(currentNumber)
                    currentNumber += 1
    //                showingsheet.toggle()
                }.sheet(isPresented: $showingsheet){
                    SecondView("Hitesh is a good boy")
                }
            }
            .padding(20)
            .toolbar{
                EditButton()
            }
            
        }
        
        
    }
    
    func removeRow(ofset: IndexSet){
        numbers.remove(atOffsets: ofset)
    }

}

#Preview {
    ContentView()
}
