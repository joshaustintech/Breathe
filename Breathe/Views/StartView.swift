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
        
        VStack(spacing: 64) {
            Spacer()
            VStack {
                Text(wording)
                    .font(.largeTitle)
                    .foregroundStyle(CustomColors.VeryLightBlue)
            }
            .frame(alignment: .leading)
            GeometryReader { geometry in
                 Circle()
                    .frame(width: 50 * dotScale, height: 50 * dotScale)
                    .foregroundColor(dotColor)
                    .position(x: dotX, y: dotY)
                     .gesture(
                        DragGesture(coordinateSpace: .global)
                            .onChanged { action in
                                if wording != StartView.pageAlternateTitle {
                                    wording = StartView.pageAlternateTitle
                                }
                                let location = action.location
                                dotX = location.x;
                                dotY = location.y / 2;
                                dotColor = CustomColors.VeryLightRed
                            }
                            .onEnded { action in
                                wording = StartView.pageTitle
                                withAnimation(
                                    Animation
                                        .spring(blendDuration: 3)
                                ) {
                                    dotScale = 1.0
                                    dotX = geometry.size.width / 2;
                                    dotY = geometry.size.height / 2;
                                    dotColor = CustomColors.VeryLightBlue
                                }
                                withAnimation(
                                   Animation
                                       .spring(blendDuration: dotAnimationDuration / 2)
                                       .repeatForever(autoreverses: true)
                                ) {
                                    dotScale = 1.8
                                }
                            }
                     )
                     .onAppear {
                         dotX = geometry.size.width / 2;
                         dotY = geometry.size.height / 2;
                         withAnimation(
                            Animation
                                .spring(blendDuration: dotAnimationDuration / 2)
                                .repeatForever(autoreverses: true)
                         ) {
                             dotScale = 1.8
                         }
                     }
            }
            Button("Begin") {
                currentPage = Pages.BreathePage
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(CustomColors.VeryLightRed)
            Spacer()
        }
        .background(CustomColors.VeryDarkBlue)
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
