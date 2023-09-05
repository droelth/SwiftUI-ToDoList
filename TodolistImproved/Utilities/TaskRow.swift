import SwiftUI

struct TaskRow: View {
    @Binding var category: Category
    @Binding var task: Task
    var isCompleted: Bool = false
    
    @State private var isDeleteConfirmationVisible = false
    
    
    var body: some View {
        HStack {
            Text(task.name)
            Spacer()
            
            Button(action: {
                toggleTaskCompletion()
            }) {
                if isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                } else {
                    Image(systemName: "circle")
                }
            }
            
           
        }
    }
    
    func toggleTaskCompletion() {
        if task.isCompleted == false {
            task.isCompleted = true
            if !category.doneTasks.contains(where: { $0.name == task.name }) {
                category.doneTasks.append(Task(name: task.name, isCompleted: true))
            }
        } else if task.isCompleted == true {
            task.isCompleted = false
            if category.doneTasks.contains(where: { $0.name == task.name }) {
                category.doneTasks.removeAll(where: { $0.name == task.name })
            }
        }
    }
    
   
}
