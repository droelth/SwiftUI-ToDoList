
import SwiftUI

struct HomeView: View {
    @StateObject var catvM = catVM()
    @State var addCatOpen = false
    @State var selectedCategoryIndex: Int? // Add this state variable
    
    var body: some View {
        NavigationStack {
            VStack{
                List(0..<catvM.myCategories.count, id: \.self) { index in
                    NavigationLink(
                        destination: CategoryView(category: $catvM.myCategories[index]),
                        tag: index,
                        selection: $selectedCategoryIndex
                    ) {
                        CategoryHome(
                                    doneTasksNo: Binding(
                                        get: { catvM.myCategories[index].doneTasks.count },
                                        set: { newValue in /* Optional: Handle updates if needed */ }
                                    ),
                                    totalTasksNo: Binding(
                                        get: { catvM.myCategories[index].tasks.count },
                                        set: { newValue in /* Optional: Handle updates if needed */ }
                                    ),
                                    categoryName: Binding(
                                        get: { catvM.myCategories[index].name },
                                        set: { newValue in /* Optional: Handle updates if needed */ }
                                    )
                                )
                    }
                }.navigationBarItems(leading: Text("Categories").bold().font(.title), trailing: Button(action: {
                    addCatOpen = true
                }, label: {
                    Text("Add Category")
                })).sheet(isPresented: $addCatOpen) {
                    CategoryAddView(myCategories: $catvM.myCategories).presentationDetents([
                        .height(100),
                        .fraction(0.2),
                    ]).presentationDragIndicator(.hidden)
                }
            }.onAppear{
                print("Done TASKS :  \(catvM.myCategories[0].doneTasks)")
                print("Total TASKS :  \(catvM.myCategories[0].tasks)")
            }
        }
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//trailing: NavigationLink(destination: {
//CategoryAddView(myCategories: $myCategories)
//}, label: {
//Text("Add Category")
//})
