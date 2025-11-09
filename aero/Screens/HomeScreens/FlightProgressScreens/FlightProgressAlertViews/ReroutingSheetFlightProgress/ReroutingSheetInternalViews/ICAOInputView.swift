//
//  ICAOInputView.swift
//  taillog
//
//  Created by Shubham Tiwari on 11/12/24.
//

import SwiftUI

struct ICAOInputView: View {
    @ObservedObject var viewModel: ReroutingSheetFlightProgressViewModel

    var body: some View {
        VStack(alignment: .leading) {
            CapitalizedTextHalfOpacity(text: "ICAO")
            HStack {
                TextField("", text: $viewModel.icaoText)
                    .font(AppFonts.largeText)
                    .padding(CustomPadding.padding)
                    .background(.dWhite)
                    .cornerRadius(5)

                Text("Add")
                    .foregroundStyle(.dWhite)
                    .font(AppFonts.largeText)
                    .padding(CustomPadding.hv(h: CustomPadding.horizontal / 3, v: CustomPadding.defaultPadding))
                    .wrapInButton {
                        viewModel.onAddOnIcao()
                    }
                    .background(viewModel.icaoIdxList.count < 3 ? .main : .gray)
                    .cornerRadius(5)
                    .disabled(viewModel.icaoIdxList.count >= 3)
            }
            .padding(CustomPadding.lPadding)
        }
    }
}

#Preview {
    ICAOInputView(viewModel: ReroutingSheetFlightProgressViewModel())
}
