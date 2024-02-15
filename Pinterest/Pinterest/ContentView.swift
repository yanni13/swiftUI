//
//  ContentView.swift
//  Pinterest
//
//  Created by 아우신얀 on 2/15/24.
//

import SwiftUI

struct ContentView: View {
    let data = Array(1...100).map {"목록 \($0)"}
    
    let columns = [
        GridItem(.adaptive(minimum: 130))
    ]
    var body: some View {
        ZStack {
            NavigationView {
                HStack {
                    Text("Pinterest")
                        .font(.title)
                    NavigationLink(destination: DetailView()) {
                        Image(systemName: "arrow.right")
                            .font(.title)
                    }
                    .padding()
                    ScrollView {
                        LazyVGrid(columns:columns, spacing: 20) {
                            ForEach(data, id: \.self) { i in
                                
                                
                                VStack {
                                    Rectangle()
                                        .fill(Color.yellow)
                                        .frame(width: 140, height: 220)
                                    Text(i)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
        }
    }
}



#Preview {
    ContentView()
}
