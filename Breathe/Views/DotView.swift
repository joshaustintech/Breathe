import SwiftUI

struct DotView : View {
    
    @Binding var foregroundColor: Color
    @Binding var backgroundColor: Color
    @Binding var dotState: DotState
    
    @Binding var showTitle: Bool
    @Binding var titleText: String?
    
    @Binding var showTimer: Bool
    @Binding var timerText: String?
    
    @Binding var showButton: Bool
    @Binding var buttonText: String?
    @Binding var buttonLink: Pages?
    
    private var dotScale: CGFloat = 1.0
    private var dotYOffset: CGFloat = 0.0
    
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .frame(width: 50 * dotScale, height: 50 * dotScale)
                .foregroundColor(foregroundColor)
                .position(
                    x: geometry.size.width / 2,
                    y: geometry.size.height / 2 + dotYOffset
                )
        }
        .frame(width: .infinity, height: .infinity)
        .background(backgroundColor, ignoresSafeAreaEdges: .all)
    }
}

struct DotViewPreview: PreviewProvider {
    @State static var foregroundColor: Color = CustomColors.VeryLightBlue
    @State static var backgroundColor: Color = CustomColors.VeryDarkRed
    @State static var dotState: DotState = 
    
    static var previews: some View {
        DotView(
            foregroundColor: $foregroundColor,
            backgroundColor: $backgroundColor
        )
    }
}
