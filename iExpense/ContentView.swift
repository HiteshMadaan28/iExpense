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
    @State private var user=User()
    @State private var showingsheet=false
    
    var body: some View {
        VStack{
            Text("The name is \(user.firstName) \(user.lastName) .")
            
            TextField("First Name", text:  $user.firstName)
            TextField("Last Name", text: $user.lastName)
            
            Button("Show Sheets")
            {
                showingsheet.toggle()
            }.sheet(isPresented: $showingsheet){
                SecondView("Hitesh is a good boy")
            }
        }
        .padding(20)
        
    }

}

#Preview {
    ContentView()
}
