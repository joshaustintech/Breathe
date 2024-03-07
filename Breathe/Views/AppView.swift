import SwiftUI

struct AppView: View {
    @State var currentPage: Pages = .StartPage

    var body: some View {
        switch currentPage {
            case .StartPage:
                StartView(currentPage: self.$currentPage)
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
