import Combine
import SwiftUI

struct RangeSlider: View {

  @Binding
  var lowerValue: Double

  @Binding
  var upperValue: Double

  let lineHight: CGFloat = 4

  let valueStart: Double

  let valueEnd: Double

  @ObservedObject
  var slider: CustomSlider

  let width: CGFloat

  let lineWidth: CGFloat = 4

  init(
    lowerValue: Binding<Double>,
    upperValue: Binding<Double>,
    valueStart: Double,
    valueEnd: Double,
    width: CGFloat
  ) {
    self._lowerValue = lowerValue
    self._upperValue = upperValue
    self.valueStart = valueStart
    self.valueEnd = valueEnd
    self.width = width

    slider = CustomSlider(start: valueStart, end: valueEnd, width: width)
  }

  // TODO: FB full width
  var body: some View {
    HStack {
      Rectangle()
        .fill(Color.gray.opacity(0.2))
        .frame(maxWidth: width, maxHeight: lineHight)
        //        .frame(width: slider.width, height: slider.lineWidth)
        .overlay(
          ZStack {
            //Path between both handles

            SliderPathBetweenView(slider: slider)

            //Low Handle
            SliderHandleView(handle: slider.lowHandle)
              .highPriorityGesture(slider.lowHandle.sliderDragGesture)

            //High Handle
            SliderHandleView(handle: slider.highHandle)
              .highPriorityGesture(slider.highHandle.sliderDragGesture)
          }
        )
    }
    //.frame(height: slider.lineWidth)
    //    .onReceive(self.slider.objectWillChange) { attr in
    //      //        if (self.slider.lowHandle.currentValue != lowerValue) {
    //      //            lowerValue = self.slider.lowHandle.currentValue
    //      //
    //      //        }
    //      //        if (self.slider.highHandle.currentValue != upperValue) {
    //      //            upperValue = self.slider.highHandle.currentValue
    //      //            return
    //      //        }
    //    }
    .onAppear {
      //      highHandle.objectWillChange.sink { _ in
      //        if highHandle.currentValue != self.upperValue {
      //          self.upperValue = highHandle.currentValue
      //        }
      //      }
      //
      //      lowHandle.objectWillChange.sink { _ in
      //        if lowHandle.currentValue != self.lowerValue {
      //          print("Hi")
      //          self.lowerValue = lowHandle.currentValue
      //        }
      //      }
    }
  }
}

struct SliderHandleView: View {
  @ObservedObject var handle: SliderHandle

  var body: some View {
    Circle()
      .frame(width: handle.diameter, height: handle.diameter)
      .foregroundColor(.white)
      .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 0)
      //.scaleEffect(handle.onDrag ? 1.3 : 1)
      .contentShape(Rectangle())
      .position(x: handle.currentLocation.x, y: handle.currentLocation.y)
  }
}

struct SliderPathBetweenView: View {
  @ObservedObject var slider: CustomSlider

  var body: some View {
    Path { path in
      path.move(to: slider.lowHandle.currentLocation)
      path.addLine(to: slider.highHandle.currentLocation)
    }
    .stroke(Color.green, lineWidth: slider.lineHight)
  }
}




