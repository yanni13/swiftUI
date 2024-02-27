//
//  ContentView.swift
//  Pinterest
//
//  Created by 아우신얀 on 2/15/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var boardData = BoardData()
    
    var items: [Board] = [ //초기 데이터
        .init(title: "Image1"),
        .init(title: "Image2"),
        .init(title: "Image3"),
        .init(title: "Image4"),
        .init(title: "Image5"),
        .init(title: "Image6")
    ]
    
    private var leftItems: [Board] {
            Array(items.prefix(upTo: items.count/2))
        }
        
    private var rightItems: [Board] {
        Array(items.suffix(from: items.count/2))
    }
    
    var body: some View {
        
        
        let columns = [GridItem(.flexible(minimum: 10, maximum: .infinity))]
        
            NavigationView {
                ScrollView {
                    
                    HStack(alignment: .top, spacing: -20) {
                        
                        VStack {
                            LazyVGrid(columns:columns, spacing: 10) {
                                ForEach(leftItems, id: \.title) { item in
                                    Image(item.title)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .scaledToFit()
                                        .cornerRadius(10)
                                    
                                }
                                
                            }
                            .padding()
                            
                        }
                        
                        
                        VStack(spacing: 20.0) {
                            LazyVGrid(columns:columns, spacing: 10) {
                                ForEach(rightItems, id: \.title) { item in
                                    Image(item.title)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .scaledToFit()
                                        .cornerRadius(10)
                                    
                                }
                            }
                            
                            .padding()
                            
                        }
                        
                        
                        .navigationBarTitle(Text("Pinterest"), displayMode: .inline)
                        .navigationBarItems(trailing:
                                                NavigationLink(destination: DetailView(boardData: boardData)) {
                            Image(systemName: "plus")
                                .foregroundColor(Color.red)
                                .font(.title)
                        })
                        
                    }
                }
                
            }
        
        
    }
}

#Preview {
    ContentView()
}
