//
//  ResultView.swift
//  Tipper
//
//  Created by Parth Patel on 2024-07-21.
//

import SwiftUI

struct ResultView: View {
    
    @Binding var totalAmount: Double
    @Binding var numOfPeople: Double
    @Binding var amountPerPerson: Double
    
    var body: some View {
        VStack{
            if numOfPeople > 1 {
                VStack(spacing: 10) {
                    Text("Total amount per person : ")
                    Text(String(format: "%.2f", amountPerPerson))
                }
            } else {
                VStack(spacing: 10) {
                    Text("Total amount : ")
                    Text(String(format: "%.2f", totalAmount))
                }
            }
        }
        .font(.title)
        .frame(height: 50)
        .padding()
        .background(.thinMaterial)
        .clipShape(.rect(cornerRadius: 10))
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        // Create state variables to simulate bindings
        @State var totalAmount: Double = 100.0
        @State var numOfPeople: Double = 10.0
        @State var amountPerPerson: Double = 100.0
        
        // Wrap ResultView in a VStack and pass state variables as bindings
        VStack {
            ResultView(totalAmount: $totalAmount, numOfPeople: $numOfPeople, amountPerPerson: $amountPerPerson)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
