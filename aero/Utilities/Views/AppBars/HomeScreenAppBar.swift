import SwiftUI

struct HomeScreenAppBar: View {
    @Binding var isOffset: Bool
//       var leadingButtonAction: () -> Void
       var titleText: String
       var actions: [AnyView] = []
    var isCenter: Bool = true;

    var body: some View {
        ZStack{
            VStack{
                Spacer()
                
                HStack {
                    itemSpacingWidth()
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isOffset.toggle()
                        }
                    }) {
                        Image(.confMenu)
                            .frame(height: Dimensions.iconSize)
                    }
                    Spacer()
                    
                    if !isCenter{
                        HStack{
                            
                            AppBarText(text: titleText)
                            
                        }
                    }
                    Spacer()
                    
                    HStack(spacing: 10) {
                        ForEach(actions.indices, id: \.self) { index in
                            actions[index]
                        }
                    }
                    
                    itemSpacingWidth()
                }
            }
            if isCenter{
                VStack{
                    HStack(spacing: 0){
                        Spacer()
                        
                        AppBarText(text: titleText)
                        
                        Spacer()
                    }
//                    .padding(CustomPadding.tPadding)
//                    .padding(CustomPadding.tPadding)
                }
            }
        }
            .background(.appBar)
            
//            .padding(CustomPadding.tPadding)       
      
        .frame(height: Dimensions.appBarHeight)
    }
}

#Preview {
    HomeScreenAppBar(isOffset: .constant(false), titleText: "Demo hai ye", actions: [
        Text("data").toAnyView()
    ])
}


    
