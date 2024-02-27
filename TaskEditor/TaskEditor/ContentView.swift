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
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(tasks) {task in
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .font(.headline)
                            Text("Due date: \(task.date, formatter: dateFormatter)") // 태스크 날짜
                                .font(.subheadline)
                            Text("Status: \(task.state)") // 태스크 상태
                                .font(.caption)
                        }
                        
                        
                    }
                    
                }
            }
            .navigationTitle("Tasks")
            .navigationBarItems(trailing:
                                    Button(action: {
                
            }, label: {
                Text("Edit")
                    .font(.title2)
            }))
            
            .navigationBarItems(trailing:
                                    Button(action: {
                addItem()
            }, label: {
                Image(systemName: "plus")
                    .font(.title2)
            })
            )
            
        }
        
    }
    func addItem() {
        let newTask = TaskItem(title: "New Task", date: Date(), state: "Not started")
        tasks.append(newTask)
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
