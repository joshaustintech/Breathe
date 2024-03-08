import SwiftUI

struct AppView: View {
    @State var currentPage: Pages = .StartPage
    @State var dotX: CGFloat = 0
    @State var dotY: CGFloat = 0
    @State var dotScale: CGFloat = 1.0
    @State var dotAnimationDuration: Double = 4

    var body: some View {
        switch currentPage {
            case .StartPage:
                StartView(
                    currentPage: self.$currentPage,
                    dotScale: self.$dotScale,
                    dotX: self.$dotX,
                    dotY: self.$dotY,
                    dotAnimationDuration: self.$dotAnimationDuration
                )
            case .BreathePage:
                BreatheView(currentPage: self.$currentPage)
            case .EndPage:
                EndView(currentPage: self.$currentPage)
        }
    }
    
}

struct AnimatedDotView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
