
import SwiftUI

class Dimensions{
    
    // ScreenSize
    static var screenSize : CGRect = UIScreen.main.bounds;
    static var screenWidth : CGFloat = screenSize.width
    static var screenHeight : CGFloat = screenSize.height
        
    
    // Padding
    static var defaultPadding : CGFloat = 8
    
//    static let padding: EdgeInsets = EdgeInsets(top: Dimensions.defaultPadding, leading: Dimensions.spaceBwItems, bottom: Dimensions.defaultPadding, trailing: Dimensions.spaceBwItems)
//    static let verticalPadding: EdgeInsets = EdgeInsets(top: Dimensions.defaultPadding, leading: 0, bottom: Dimensions.defaultPadding, trailing: 0)
//    static let horizontalPadding: EdgeInsets = EdgeInsets(top: 0, leading: Dimensions.spaceBwItems, bottom: 0, trailing: Dimensions.spaceBwItems)
    
    static var topPadding : CGFloat = 8
    static var rightPadding : CGFloat = 8
    static var bottomPadding : CGFloat = 8
    static var leftPadding : CGFloat = 8
    
    // Icons
    static var iconSize : CGFloat = 25
    
    // AppBar
    static var appBarHeight : CGFloat = 35
    
    
    // Corners Radius
    static var btnRadius : CGFloat = 5;
    
    // Search Fields
    static var searchFieldRadius : CGFloat = 10
    
    
    // Spacing
    static var spaceBwItems : CGFloat = 20;
    static var spaceBwSections : CGFloat = 40;
    static var appBarAlignCenterSpacingWidth : CGFloat = screenWidth * 0.2
    
    
    // Buttons
    static var btnHeight : CGFloat = 42;
    static var btnWidth : CGFloat = 255;
    
    
    // TextFields
    static var textFieldHeight : CGFloat = 42;
    static var textFieldWidth : CGFloat = btnWidth - 10;
    
    // Segments
    static var segmentBgHeight : CGFloat  = 50;
    
    // FLight Progress
    static var flightProgressTableRowHeight : CGFloat = 50;
    
    // Configurations
    
    
    static var defaultRowHeight : CGFloat  = 43
    
    static var rowHeight : CGFloat = 35
    
    // static var navigationSplitViewPrimaryWidth : CGFloat = screenSize.width * 0.31;
    static var navigationSplitViewPrimaryWidth : CGFloat = screenSize.width * 0.4;
    static var navigationSplitViewDetailWidth: CGFloat = screenSize.width * 0.6
    
    // Headings
    static var ofpHeadingHeight : CGFloat = 45
    
    //Sidebar
    static var sidebarWidth : CGFloat = screenSize.width * 0.35;
    static var sidebarOffset : CGFloat = screenSize.width * 0.35;
    
    // NOTAM Pop Over
    static var pickerPopupHeight : CGFloat = screenWidth * 0.15
    static var pickerPopupWidth : CGFloat = screenWidth * 0.2
    
    // SHEETS
    static var sheetWidth : CGFloat = screenWidth * 0.6826
    static var sheetHeight : CGFloat = screenHeight * 0.726
    
    static var sheetHeaderHeight : CGFloat = 50
    
    static var customSheetWidth : CGFloat = screenWidth * 0.8
    static var customSheetHeight : CGFloat = screenWidth
    
    static var flexSheetWidth : CGFloat = 600
    static var flexSheetHeight : CGFloat = 700
    
    // DIVIDER
    static var dividerContentSpacing : CGFloat = 3.25
    
    // SINGLE VIEW SCREEN BOX HEIGHT
    static var singleViewBoxHeight : CGFloat = 200
    
    // Dialog box
    static let dialogBoxWidth : CGFloat = 300
    
    // Status Bar Height
    static let statusBarHeight : CGFloat = 25
}
