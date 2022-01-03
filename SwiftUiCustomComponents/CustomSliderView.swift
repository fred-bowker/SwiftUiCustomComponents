import SwiftUI

struct CustomSliderView: View {

  @State
  var singleSliderValue: Double = 0

  // TODO: FB need to change this to use a geometryReader so that it automatically calculates width
  //  of parent
  @ObservedObject
  var slider = CustomSlider(start: 1, end: 2, width: 350)

  var body: some View {
    VStack {

      // Single slider

      VStack {
        HTextView(
          label: "Single slider value", valueText: String(format: "%.0f", singleSliderValue))
        Slider(value: $singleSliderValue, in: 18...100, step: 1)
          .accentColor(Color.green)

      }
      .frame(maxWidth: 350)
      .padding()

      // Double slider

      VStack {

        HTextView(
          label: "Double slider value",

          valueText: String(format: "%.5f", slider.lowHandle.currentValue) + "-"
            + String(format: "%.5f", slider.highHandle.currentValue))

        //GeometryReader { geometry in
        RangeSlider(slider: slider)
                .accentColor(Color.green)
        //}
      }
      .padding()
    }
  }
}
