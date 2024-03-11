import SwiftUI

struct StartView: View {
    @Binding var currentPage: Pages
    @Binding var dotScale: CGFloat
    @Binding var dotX: CGFloat
    @Binding var dotY: CGFloat
    @Binding var dotAnimationDuration: Double
    
    static var pageTitle = "2 Minute Breathing Exercise"
    static var pageAlternateTitle = "Or that 😁"
    
    @State var wording: String = pageTitle
    @State var dotColor: Color = CustomColors.VeryLightBlue
    
    var body: some View {
        Spacer()
    }
    
}

struct StartViewPreview : PreviewProvider {
    @State static var currentPage: Pages = Pages.StartPage
    @State static var dotScale: CGFloat = 1.0
    @State static var dotX: CGFloat = 0
    @State static var dotY: CGFloat = 0
    @State static var dotAnimationDuration: Double = 3
    
    static var previews: some View {
        StartView(
            currentPage: $currentPage,
            dotScale: $dotScale,
            dotX: $dotX,
            dotY: $dotY,
            dotAnimationDuration: $dotAnimationDuration
        )
    }
}
