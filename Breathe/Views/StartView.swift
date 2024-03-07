import SwiftUI

struct StartView: View {
    @Binding var currentPage: Pages
    
    var body: some View {
        VStack(spacing: 64) {
            Text("Start Page")
                .font(.largeTitle)
            Button("Go to Breathing page") {
                currentPage = Pages.BreathePage
            }
        }
    }
}

struct StartViewPreview : PreviewProvider {
    @State static var page = Pages.StartPage
    
    static var previews: some View {
        StartView(currentPage: $page)
    }
}
