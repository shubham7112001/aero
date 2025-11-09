import SwiftUI


protocol AppWheelPickerItem: Hashable, Identifiable {
    var id: Self { get }
    var displayName: String { get }
}

struct AppWheelPicker<T: AppWheelPickerItem>: View {
    @Binding var selectedItem: T
    let items: [T]
    var width: CGFloat?
    
    init(selectedItem: Binding<T>, items: [T], width: CGFloat? = nil) {
        self._selectedItem = selectedItem
        self.items = items
        self.width = width ?? Dimensions.screenSize.width * 0.3
        
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().backgroundColor = .white
    }
    
    var body: some View {
        Picker("", selection: $selectedItem) {
            ForEach(items) { item in
                Text(item.displayName).tag(item)
            }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(width: width, height: 200) // Adjust height as needed
        .clipped() // Ensure the picker doesn't overflow its bounds
        .padding(EdgeInsets(top: Dimensions.topPadding, leading: Dimensions.leftPadding, bottom: Dimensions.bottomPadding, trailing: Dimensions.rightPadding))
    }
}

