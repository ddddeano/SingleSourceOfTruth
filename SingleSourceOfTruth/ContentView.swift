
// This App is an exersize for separately abstracting Views, ViewModels and Data Models
// Each View; List View and Row View, have their own separate View Models, which are designed to interact with each other whilst sharing the same Data Model as a Single Source of Truth.
// "Single Source of Truth" is considered the best practice in SwiftUI, and this code is pursuing that.
// Currently the List and the Row is just an example and would not need separate models in such a simple application, however the concepts learned from this can be applied to bigger more complex projects.

// the data model holds an array of booleans, and a toggle function, the array is displayed in a ListView, managed by the ListViewModel. The List is compiled of RowViews, Managed By a RowViewModel, which contains the code for processing the user input and displaying "star.fill" : "star"



import SwiftUI

struct ListView: View {
    
    @StateObject var listViewModel = ListViewModel(DataModel())
    
    var body: some View {
        List {
            ForEach(listViewModel.dataModel.things.indices, id: \.self) { thing in
                RowView(rowViewModel: RowViewModel(thing, listViewModel))
            }
        }
    }
}

struct RowView: View {

    @StateObject var rowViewModel: RowViewModel
    
    var body: some View {
        Image(systemName: rowViewModel.imageGet)
            .foregroundColor(.yellow)
            .onTapGesture {
                rowViewModel.toggle(rowViewModel.i)
        }
    }
}


