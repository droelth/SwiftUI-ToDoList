
import SwiftUI

struct CategoryView: View {
    @Binding var category: Category
    @State var newTaskName = ""

    var body: some View {
        VStack {
            List {
                Section(header: Text("Tasks")) {
                    ForEach(Array(category.tasks.enumerated()), id: \.1.id) { index, task in
                        TaskRow(category: $category, task: $category.tasks[index], isCompleted: category.tasks[index].isCompleted)
                    }
                }

                Section {
                    TextField("New Task", text: $newTaskName).autocorrectionDisabled()
                    Button(action: {
                        if !newTaskName.isEmpty {
                            category.tasks.append(Task(name: newTaskName))
                            newTaskName = ""
                        }
                    }) {
                        Text("Add Task")
                    }
                }
            }
            .navigationTitle(category.name)
        }.onAppear{
            print(category.doneTasks.count)
        }
    }
}



