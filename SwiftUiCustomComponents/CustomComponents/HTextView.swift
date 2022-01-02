import SwiftUI

struct HTextView: View {
  let label: String
  let valueText: String

  init(label: String, valueText: String) {
    self.label = label
    self.valueText = valueText
  }

  var body: some View {
    HStack {
      Text(label)
      Spacer()
      Text(valueText)
    }
  }
}
