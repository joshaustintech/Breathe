import SwiftUI

struct EndView: View {
    @Binding var currentPage: Pages
    
    var body: some View {
        VStack(spacing: 64) {
            Text("End Page")
                .font(.largeTitle)
            Button("Go back to Start page") {
                currentPage = Pages.StartPage
            }
        }
    }
}

struct EndViewPreview : PreviewProvider {
    @State static var page = Pages.EndPage
    
    static var previews: some View {
        EndView(currentPage: $page)
    }
}
