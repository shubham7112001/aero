



import SwiftUI


struct ConfigurationScreen: View {
    @State var selected = PrimaryScreenConfigurationScreenSelection.userAdmin
    
    @State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    
    @ObservedObject var homeScreenViewModel : HomeScreenViewModel
    var body: some View {
        ZStack{
            Color(.mediumLightGrey)
            VStack(spacing: 0){
                AppBarConfigurationScreen(isOffset: $homeScreenViewModel.isOffset)
                if (!homeScreenViewModel.isOffset){
                    NavigationSplitView(
                        columnVisibility: $columnVisibility,
                        
                        sidebar: {
                            
                            PrimaryScreenConfigurationScreens(selectedBtn: $selected)
                                .toolbar(removing: ToolbarDefaultItemKind.sidebarToggle)
                                .navigationSplitViewColumnWidth(Dimensions.navigationSplitViewPrimaryWidth)
                        }
                        ,
                        
                        detail: {
                            if (selected == PrimaryScreenConfigurationScreenSelection.userAdmin){
                                UserAdministrationDetailScreenConfigurationScreen()
                            }
                            else if (selected == PrimaryScreenConfigurationScreenSelection.sysParams){
                                SystemParamatersDetailScreenConfigurationScreen()
                            }
                            else if (selected == PrimaryScreenConfigurationScreenSelection.repRetention){
                                ReportingRetentionDetailScreenConfigurationScreen()
                            }
                            
                        }
                        
                    )
                    
                    .navigationSplitViewStyle(.balanced)
                    
                }
                else{
                    VStack{
                        HStack(spacing: 0){
                            
                            PrimaryScreenConfigurationScreens(selectedBtn: $selected)
                            
                            Divider().frame(width: 1).background()
                            VStack{
                                if (selected == PrimaryScreenConfigurationScreenSelection.userAdmin){
                                    UserAdministrationDetailScreenConfigurationScreen()
                                }
                                else if (selected == PrimaryScreenConfigurationScreenSelection.sysParams){
                                    SystemParamatersDetailScreenConfigurationScreen()
                                }
                                else if (selected == PrimaryScreenConfigurationScreenSelection.repRetention){
                                    ReportingRetentionDetailScreenConfigurationScreen()
                                    
                                }
                            }
                                .disabled(true)
                            
                        }
                    }
                }
            }
                .padding(.top, Dimensions.statusBarHeight)
            
        }
        .navigationBarBackButtonHidden()
//        .padding(.top, Dimensions.statusBarHeight)
        .frame(width: Dimensions.screenWidth, height: Dimensions.screenHeight)
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now()){
                withAnimation{
                    homeScreenViewModel.isOffset = false
                }
            }
            
        }
        .ignoresSafeArea()
        
    }
        
}




#Preview {
    ConfigurationScreen(homeScreenViewModel: HomeScreenViewModel())
}
