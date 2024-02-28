//
//  EditView.swift
//  TaskEditor
//
//  Created by 아우신얀 on 2/27/24.
//

import SwiftUI

struct EditView: View {
    
    @Binding var task: TaskItem
    
    var body: some View {
        VStack(alignment: .leading) {
            
            TextField("New Task", text: $task.title)
                .font(.subheadline)
            DatePicker(
                selection: $task.date, displayedComponents: .date) {
                    Text("Due Date")
                }
                
                Picker("Status", selection: $task.state) {
                    Text("Not started").tag("Not started")
                    Text("In progress").tag("In progress")
                    Text("Complete").tag("Complete")
                }
                .pickerStyle(SegmentedPickerStyle())
            
        }
    }
}

//#Preview {
//    EditView(task: $task)
//}
