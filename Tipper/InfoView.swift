//
//  InfoView.swift
//  Tipper
//
//  Created by Parth Patel on 2024-07-21.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("X")
                }
            }
            .font(.title)
            .foregroundStyle(.white)
            .background(
                Circle()
                    .fill(Color(.black)).opacity(0.5)
                    .frame(width: 50, height: 50)
            )
            .offset(x: -150, y: -150)
            
            VStack(alignment: .center) {
                Image(systemName: "info")
                    .font(.system(size: 50))
                    .padding(.bottom, 40)
                Text("A simple tip calculator that calculates the total amount after tip for an individual. \n\nThe maximum tip amount is 20% \n\nYou can split the bill between 1 to 25 people. ")
                    .font(.title2)
            }
            .frame(width: 350)
            .padding()
            .background(.regularMaterial).opacity(0.8)
            .clipShape(.rect(cornerRadius: 20))
        }
        .background(
            Image("back")
                .scaledToFill()
                .opacity(0.3)
        )
    }
}

#Preview {
    InfoView()
}
