//
//  NewTaskView.swift
//  Procrastinot_App
//
//  Created by Jyotir McEwan-Anamoah on 4/7/24.
//

import SwiftUI

struct NewTaskView: View {
    /// View Properties
    @Environment(\.dismiss) private var dismiss
    /// Model Context For Saving Data
    @Environment(\.modelContext) private var context
    @State private var taskTitle: String = ""
    @State private var taskStartDate: Date = .init()
    @State private var taskEndDate: Date = .init()
    @State private var taskColor: String = "TaskColor 1"
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .foregroundColor(.none) // Changed color to black
            })
            .padding(.leading) // Changed indentation
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Task Name") // Changed "Task Title" to "Task Name"
                    .font(.caption)
                    .foregroundColor(.gray) // Changed to gray
                
                TextField("Go for a Walk!", text: $taskTitle)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)) // Simplified background style
            }
            
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Start Time") // Changed "Task Date" to "Task Start Time"
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    DatePicker("", selection: $taskStartDate, displayedComponents: .hourAndMinute) // Allow picking start time
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task End Time") // Added "Task End Time"
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    DatePicker("", selection: $taskEndDate, displayedComponents: .hourAndMinute) // Allow picking end time
                        .datePickerStyle(.compact)
                        .scaleEffect(0.9, anchor: .leading)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Task Color")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    let colors: [String] = (1...5).map { "TaskColor \($0)" }
                    
                    HStack(spacing: 0) {
                        ForEach(colors, id: \.self) { color in
                            Circle()
                                .fill(Color(color))
                                .frame(width: 20, height: 20)
                                .overlay(
                                    Circle().stroke(Color.black, lineWidth: taskColor == color ? 2 : 0) // Simplified color selection style
                                )
                                .onTapGesture {
                                    withAnimation(.easeInOut) { // Changed animation
                                        taskColor = color
                                    }
                                }
                                .padding(.horizontal, 5) // Added padding
                        }
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                /// Saving Task
                let task = Task(taskTitle: taskTitle, creationDate: taskStartDate, isCompleted: false, tint: taskColor) // Updated Task initialization

                do {
                    context.insert(task)
                    try context.save()
                    /// After Successful Task Creation, Dismissing the View
                    dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            }, label: {
                Text("Create Task")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(taskColor), in: RoundedRectangle(cornerRadius: 10)) // Updated background style
            })
            .disabled(taskTitle.isEmpty || taskStartDate > taskEndDate) // Disabled when title is empty or start time is after end time
            .opacity(taskTitle.isEmpty || taskStartDate > taskEndDate ? 0.5 : 1) // Adjusted opacity
            .padding() // Added padding
        }
        .padding(15)
    }
}

#Preview {
    NewTaskView()
        .padding()
}

