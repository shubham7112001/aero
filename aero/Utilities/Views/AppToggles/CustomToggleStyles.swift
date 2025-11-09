
import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray)
                .frame(width: 30, height: 45)
                .overlay(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 26, height: 30)
                        .offset(y: configuration.isOn ? 10 : -10)
                )
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                                        configuration.isOn.toggle()
                                    }
                                }
                }
}


