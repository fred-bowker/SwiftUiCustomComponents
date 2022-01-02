import SwiftUI

struct CustomSliderView: View {

  @State
  var singleSliderValue: Double = 0

  // this needs to change we should only change this once also we should take in a step for changing it
  @State
  var rangeSliderLowerValue: Double = 18

  @State
  var rangeSliderUpperValue: Double = 100

  var body: some View {
    VStack {

      // Single slider

      VStack {
        HTextView(
                label: "Single slider value", valueText: String(format: "%.0f", singleSliderValue))
        Slider(value: $singleSliderValue, in: 18...100, step: 1)
                .accentColor(Color.green)

      }.padding()

      // Double slider

        VStack {

          HTextView(
                  label: "Double slider value",

                  valueText: String(format: "%.0f", rangeSliderLowerValue) + "-"
                          + String(format: "%.0f", rangeSliderUpperValue))

          GeometryReader { geometry in
          RangeSlider(
                  lowerValue: $rangeSliderLowerValue,
                  upperValue: $rangeSliderUpperValue,
                  valueStart: 18,
                  valueEnd: 100,
                  width: geometry.size.width)
        }
      }.padding()

    }
  }

}

//struct SliderView: View {
//  @ObservedObject var slider: CustomSlider
//
//  // TODO: FB full width
//  var body: some View {
//    Rectangle()
//            .fill(Color.gray.opacity(0.2))
//            .frame(width: slider.width, height: slider.lineWidth)
//            .overlay(
//                    ZStack {
//                      //Path between both handles
//                      SliderPathBetweenView(slider: slider)
//
//                      //Low Handle
//                      SliderHandleView(handle: slider.lowHandle)
//                              .highPriorityGesture(slider.lowHandle.sliderDragGesture)
//
//                      //High Handle
//                      SliderHandleView(handle: slider.highHandle)
//                              .highPriorityGesture(slider.highHandle.sliderDragGesture)
//                    }
//            )
//  }
//}

//struct SliderHandleView: View {
//  @ObservedObject var handle: SliderHandle
//
//  var body: some View {
//    Circle()
//            .frame(width: handle.diameter, height: handle.diameter)
//            .foregroundColor(.white)
//            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 0)
//            //.scaleEffect(handle.onDrag ? 1.3 : 1)
//            .contentShape(Rectangle())
//            .position(x: handle.currentLocation.x, y: handle.currentLocation.y)
//  }
//}
//
//struct SliderPathBetweenView: View {
//  @ObservedObject var slider: CustomSlider
//
//  var body: some View {
//    Path { path in
//      path.move(to: slider.lowHandle.currentLocation)
//      path.addLine(to: slider.highHandle.currentLocation)
//    }
//            .stroke(Color.green, lineWidth: slider.lineWidth)
//  }
//}
