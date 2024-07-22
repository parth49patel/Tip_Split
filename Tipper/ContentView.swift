//
//  ContentView.swift
//  Tipper
//
//  Created by Parth Patel on 2024-07-20.
//

import SwiftUI

struct ContentView: View {
    
    @State var billTotal: String = ""
    @State var tipValue: Double = 0.00
    @State var totalAmount: Double = 0.00
    @State var numOfPeople: Double = 1
    @State var amountPerPerson: Double = 0.00
    @State var showResult: Bool = false
    @State var infoView: Bool = false
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack{
                    ScrollView {
                        VStack(spacing: 40){
                            VStack(alignment: .leading) {
                                InputView(billTotal: $billTotal, tipValue: $tipValue, numOfPeople: $numOfPeople)
                            }
                            .padding(10)
                            VStack {
                                Button(action: {
                                    if numOfPeople > 1 {
                                        perPersonAmount()
                                    } else {
                                        calculateTotal()
                                    }
                                    showResult = true
                                    dismissKeyboard()
                                    isFocused = false
                                })
                                {
                                    Text("Calculate")
                                }
                                .frame(width: 125, height: 50)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundStyle(.white)
                                .background(.green)
                                .clipShape(.rect(cornerRadius: 10))
                                .padding(.bottom, 40)
                                if showResult {
                                    ResultView(totalAmount: $totalAmount, numOfPeople: $numOfPeople, amountPerPerson: $amountPerPerson)
                                }
                                
                            }
                        }
                    }
                    .navigationTitle("Tip and Split")
                    .toolbar{
                        ToolbarItem(placement: .bottomBar) {
                            HStack{
                                Spacer()
                                Button{
                                    infoView.toggle()
                                } label: {
                                    Image(systemName: "info.circle.fill")
                                        .tint(Color(.white))
                                        .opacity(0.7)
                                        .font(.system(size: 30, weight: .medium))
                                }
                                .sheet(isPresented: $infoView, content: {
                                    InfoView()
                                })
                                .padding(.horizontal, 15)
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button {
                                billTotal = ""
                                tipValue = 0.00
                                totalAmount = 0.00
                                numOfPeople = 1.00
                                amountPerPerson = 0.00
                                showResult = false
                            } label: {
                                Text("Clear")
                                    .frame(width: 80, height: 30)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .background(Color("inputbg2"))
                                    .clipShape(.rect(cornerRadius: 10))
                            }
                        }
                    }
                }
                .background(
                    Image("back")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.3)
                )
            }
        }
        
    }
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    func calculateTotal() {
        guard let billAmount = Double(billTotal) else {
            return
        }
        let tipAmount = billAmount * (tipValue / 100)
        totalAmount = tipAmount + billAmount
    }
    
    func perPersonAmount() {
        guard let billAmount = Double(billTotal) else {
            return
        }
        let tipAmount = billAmount * (tipValue / 100)
        totalAmount = tipAmount + billAmount
        amountPerPerson = totalAmount / Double(numOfPeople)
    }
}

#Preview {
    ContentView(billTotal: "", tipValue: 4.00, numOfPeople: 1)
        .preferredColorScheme(.dark)
}
