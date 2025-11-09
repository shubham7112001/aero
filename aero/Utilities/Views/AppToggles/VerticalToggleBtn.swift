//
//  VerticalToggleBtn.swift
//  taillog
//
//  Created by Sword Software on 27/06/24.
//

import SwiftUI

struct VerticalToggleBtn: View {
    @Binding var isOn : Bool
    var body: some View {
        
            Toggle("", isOn: $isOn)
                    .toggleStyle(CustomToggleStyle())
                    
    }
}

#Preview {
    VerticalToggleBtn(isOn: .constant(false))
}
