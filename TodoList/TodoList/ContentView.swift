//
//  ContentView.swift
//  TodoList
//
//  Created by 아우신얀 on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showing = false
    @State private var todoItems: [TodoItem] = []
    
    var body: some View {
        
        ZStack {
            VStack {
                
                VStack {
                    
                    Button(action: {
                        showing = true
                        
                    }, label: {
                        Image(systemName: "plus.circle")
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(Color.red)
                            .font(.title2)
                    })
                    
                }
                .frame(width: 350, height: 30, alignment: .trailing)
                
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Todo List")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    
                    List($todoItems) { $item in
                        Toggle(isOn: $item.isCompleted) {
                        
                            Text(item.title)
                        }
                        
                    }
                    
                }
                
            }
            if showing {
                PopUpView(showing: $showing, items: $todoItems)
            }

        }
    }
}

#Preview {
    ContentView()
}

