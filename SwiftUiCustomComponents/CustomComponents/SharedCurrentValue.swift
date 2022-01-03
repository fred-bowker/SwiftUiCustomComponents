import SwiftUI

class SharedCurrentValue: ObservableObject {

    @Published
    var currentValue: Double = 0

}
