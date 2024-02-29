//
//  ContentView.swift
//  TaskEditor
//
//  Created by 아우신얀 on 2/27/24.
//

import SwiftUI

struct TaskItem: Identifiable {
    var id = UUID()
    var title: String
    var date: Date
    var state: String
}

struct ContentView: View {
    
    @State private var tasks = [TaskItem]()
    @State private var date = Date()
    @State private var isEditForm = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach($tasks) { $task in
                        //Stack(alignment: .leading) {
                            if isEditForm {
                                EditView(task: $task)
                            } else {
                                TaskView(task: task)
                            }
                       // }
                        
                        
                    }
                    .onDelete(perform: deleteTasks)
                    
                }
            }
            .navigationTitle("Tasks")
            .navigationBarItems(trailing:
                                    HStack {
            
                Button {
                    addItem()
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                }.disabled(isEditForm)
                Button {
                    isEditForm.toggle()
                } label: {
                    Text(isEditForm ? "Done" : "Edit")
                        .font(.title2)
                }
            })
                                    
            
            
            
        }
    }
    
    func addItem() {
        let newTask = TaskItem(title: "New Task", date: Date(), state: "Not started")
        tasks.append(newTask)
    }
    
    func deleteTasks(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
}()

#Preview {
    ContentView()
}
