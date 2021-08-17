
import SwiftUI

class ListViewModel: ObservableObject {
    @Published var dataModel: DataModel

    init(_ dataModel: DataModel) {
        self.dataModel = dataModel
    }
    
    func toggle(_ i: Int) {
        dataModel.toggle(i)
    }
}

class RowViewModel: ObservableObject {
    @Published var listViewModel: ListViewModel
    @Published var image: String
    var i: Int
    
    var imageGet: String {
        let imageName = listViewModel.dataModel.things[i] ? "star.fill" : "star"
        print(imageName)
        
        return imageName
        
    }
    
    init(_ i: Int, _ listViewModel: ListViewModel) {
        self.i = i
        self.listViewModel = listViewModel
        self.image = listViewModel.dataModel.things[i] ? "star.fill" : "star"

    }
    func toggle(_ i: Int){
        listViewModel.toggle(i)
    }
    
}
