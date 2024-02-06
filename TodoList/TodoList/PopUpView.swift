//
//  PopUpView.swift
//  TodoList
//
//  Created by 아우신얀 on 2/6/24.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id: UUID = UUID()
    var title : String
    var isCompleted: Bool = false //토글 완료 상태
    
}

struct PopUpView: View {
    
    @State var todo = ""
    @Binding var showing: Bool
    @State var toggleOn = false
    @Binding var items : [TodoItem]
    
    var body: some View {
        VStack {
            TextField("입력하세요.", text: $todo)
                .padding()
            
            Button(action: {
                AddData()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                    Text("next")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding()
                }
                
            })
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 30)
    }
    
    func AddData() {
        let newItem = TodoItem(title: todo, isCompleted: false)
                items.append(newItem)
                todo = ""
        print(items)
        showing = false
    }
}

#Preview {
    PopUpView(showing: .constant(true), items: .constant([]))
}




