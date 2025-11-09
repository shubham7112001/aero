//
//  InternalSecuritySealLogScreen.swift
//  taillog
//
//  Created by Shubham Tiwari on 24/09/24.
//

import SwiftUI

struct InternalSecuritySealLogScreen: View {
    @Environment(\.dismiss) var dismiss
        let columns = [GridItem(.flexible())]
        @State  var searchText: String = ""
        var body: some View {
            
            ZStack {
                VStack(spacing:0) {
                    ScrollView{
                            LazyVGrid(columns: columns, spacing: 10, pinnedViews: [.sectionHeaders]){
                                Section(header:
                                            Text("Header")
                                ) {
                                    ForEach(0..<5){_ in
                                        Text("Data")
                                            .padding(8)
                                    }
                                }
                            }
                    }
                    
                    
                }
            }
        }
    }

#Preview {
    InternalSecuritySealLogScreen()
}
