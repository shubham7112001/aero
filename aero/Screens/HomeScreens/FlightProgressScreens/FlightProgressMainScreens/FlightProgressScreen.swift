
import SwiftUI

enum FlightProgressAlertType{
    case man
    case xfer
}

struct FlightProgressScreen: View {
    
    @StateObject var viewModel : FlightProgressViewModel = FlightProgressViewModel()
    @ObservedObject var homeScreenViewModel: HomeScreenViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color(.appBar)
                
                VStack(spacing : 0){
                    
                    AppBarFlightProgressScreen(isOffset: $homeScreenViewModel.isOffset)
                        .padding(CustomPadding.bPadding)
                    
                    HorizontalDivider(height: 1)
                    
                    
                    UpperAreaFlightProgressScreen()
                        
                    
                    HorizontalPageviewFlightProgressScreen()
                    
                    TableLayoutFlightProgressScreen(viewModel: viewModel)
                        
                    
                    Spacer()
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    FlightProgressScreen(homeScreenViewModel: HomeScreenViewModel())
}
