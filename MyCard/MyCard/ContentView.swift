//
//  ContentView.swift
//  MyCard
//
//  Created by 아우신얀 on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        ZStack {
            Color(red:0.09, green:0.63, blue:0.52)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("MySImg")
                    .resizable()
                    .frame(width: 200.0, height: 200.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                )
                Text("ShinYan Au")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "010-0000-0000", imageName: "phone.fill")
                InfoView(text: "iumd6075@naver.com", imageName: "envelope.fill")
            }

            

        }

    }
}


#Preview {
    ContentView()
}
