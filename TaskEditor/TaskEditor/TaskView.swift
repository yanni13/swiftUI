//
//  TaskView.swift
//  TaskEditor
//
//  Created by 아우신얀 on 2/28/24.
//

import SwiftUI

struct TaskView: View {
    
    let task: TaskItem
    
    var body: some View {
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

//#Preview {
//    TaskView()
//}
