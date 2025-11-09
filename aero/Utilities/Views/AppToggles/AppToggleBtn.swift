//
//  AppToggleBtn.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct AppToggleBtn: View {
    @Binding var isOn : Bool
    var body: some View {
        Toggle("", isOn: $isOn)
    }
}

#Preview {
    AppToggleBtn(isOn: .constant(false))
}
