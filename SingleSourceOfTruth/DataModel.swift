
import SwiftUI

class DataModel: ObservableObject {
    @Published var things = [true,true,true,true,true]
    
    func toggle(_ i: Int) {
        self.things = things.map{_ in false}
        things[i] = true
        print(things)
    }
}
