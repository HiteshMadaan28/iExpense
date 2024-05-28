//
//  ContentView.swift
//  iExpense
//
//  Created by Hitesh Madaan on 23/05/24.
//

import Observation
import SwiftUI

@Observable
class User{
    var firstName="Hitesh"
    var lastName="Madaan"
}
struct ContentView: View {
    @State private var user=User()
    
    var body: some View {
        VStack{
            Text("The name is \(user.firstName) \(user.lastName) .")
            
            TextField("First Name", text:  $user.firstName)
            TextField("Last Name", text: $user.lastName)
        }
        .padding(20)
        
    }

}

#Preview {
    ContentView()
}
