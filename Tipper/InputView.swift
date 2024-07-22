//
//  InputView.swift
//  Tipper
//
//  Created by Parth Patel on 2024-07-21.
//

import SwiftUI

struct InputView: View {
    
    @Binding var billTotal: String
    @Binding var tipValue: Double
    @Binding var numOfPeople: Double
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Text("Enter the bill total:")
                TextField("0.00", text: $billTotal)
                    .focused($isFocused)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.7))
                    .foregroundStyle(.white)
                    .frame(width: 130)
                    .keyboardType(.decimalPad)
                    .background()
                    .clipShape(.rect(cornerRadius: 10))
            }
            .padding(.vertical)
            .onTapGesture {
                isFocused = false
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            
            Divider()
            
            HStack{
                Text("Tip Percentage: ")
                Text(String(format: "%.0f", tipValue))
                Text("%")
            }
            
            Slider(
                value: $tipValue,
                in: 0...20,
                step: 1,
                minimumValueLabel: Text("0")
                    .font(.subheadline),
                maximumValueLabel: Text("20")
                    .font(.subheadline),
                label: {
                    Text("Enter the tip percentage ")
                })
            
            Divider()
            
            HStack{
                Text("Number of People: ")
                Stepper(String(format: "%.0f",numOfPeople), value: $numOfPeople, in: 1...25)
                    .frame(width: 150)
            }
        }
        .font(.title2)
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .clipShape(.rect(cornerRadius: 10))
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        // Define mock bindings
        let billTotal = Binding<String>(get: { "100.00" }, set: { _ in })
        let tipValue = Binding<Double>(get: { 10.0 }, set: { _ in })
        let numOfPeople = Binding<Double>(get: { 2.0 }, set: { _ in })
        
        // Use mock bindings in InputView preview
        InputView(billTotal: billTotal, tipValue: tipValue, numOfPeople: numOfPeople)
    }
}

