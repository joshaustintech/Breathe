import SwiftUI

struct BreatheView: View {
    @Binding var currentPage: Pages
    @Binding var dotScale: CGFloat
    @Binding var dotX: CGFloat
    @Binding var dotY: CGFloat
    @Binding var dotAnimationDuration: Double
    
    @State var dotColor: Color = CustomColors.VeryLightBlue
    
    var body: some View {
        
        VStack(spacing: 64) {
            Spacer()
                .frame(alignment: .leading)
            
            GeometryReader { geometry in
                Circle()
                    .frame(width: 50 * dotScale, height: 50 * dotScale)
                    .foregroundColor(dotColor)
                    .position(x: dotX, y: dotY)
            }
            .onAppear {
                withAnimation(
                   Animation
                       .spring(blendDuration: dotAnimationDuration / 2)
                       .repeatForever(autoreverses: true)
                ) {
                    dotScale = 0.7
                }
                
                withAnimation(
                   Animation
                       .easeInOut(duration: dotAnimationDuration)
                       .repeatForever(autoreverses: true)
                ) {
                    dotY = dotY - 64
                }
            }
            
            Text("02:00")
                .font(.title2)
                .monospaced()
                .foregroundColor(CustomColors.VeryLightRed)
            Spacer()
        }
        .background(CustomColors.VeryDarkBlue)
    }
}

struct BreatheViewPreview : PreviewProvider {
    @State static var currentPage = Pages.BreathePage
    @State static var dotScale: CGFloat = 1.0
    @State static var dotX: CGFloat = 0
    @State static var dotY: CGFloat = 0
    @State static var dotAnimationDuration: Double = 3
    
    static var previews: some View {
        BreatheView(
            currentPage: $currentPage,
            dotScale: $dotScale,
            dotX: $dotX,
            dotY: $dotY,
            dotAnimationDuration: $dotAnimationDuration
        )
    }
}
