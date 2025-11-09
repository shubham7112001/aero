
import SwiftUI

enum IconImageContent {
    case systemImage(String)
    case customImage(Image)
}

struct IconImage: View {
    let content: IconImageContent
    var size : CGFloat = 20
    var height : CGFloat?
    var width : CGFloat?
    
    var color : Color = Color.white
    var body: some View {
        
        switch content {
        case .systemImage(let imageName):
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width ?? size, height: height ?? size)
                .foregroundColor(color)
            
        case .customImage(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width ?? size, height: height ?? size)
                .foregroundColor(color)
        }
    }
}

struct IconImage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color(.red)
            
            VStack {
                IconImage(content: .systemImage("star.fill"))
                IconImage(content: .customImage(Image(.updateButtonInactive)))
            }
        }
    }
}

