import SwiftUI

struct BreatheView: View {
    @Binding var currentPage: Pages
    
    var body: some View {
        VStack(spacing: 64) {
            Text("Breathing Page")
                .font(.largeTitle)
            Button("Finish") {
                currentPage = Pages.EndPage
            }
        }
    }
}

struct BreatheViewPreview : PreviewProvider {
    @State static var page = Pages.BreathePage
    
    static var previews: some View {
        BreatheView(currentPage: $page)
    }
}
