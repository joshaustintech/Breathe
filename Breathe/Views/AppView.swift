import SwiftUI

struct AppView: View {
    @State var currentViewState: ViewStates = .Starting
    @State var foregroundColor: Color = CustomColors.VeryLightBlue
    @State var backgroundColor: Color = CustomColors.VeryDarkBlue
    @State var accentColor: Color = CustomColors.VeryLightRed
    @State var currentText: String = "2 Minute Breathing Exercise"
    
    var body: some View {
        GeometryReader() { geometry in
            if currentViewState != .Breathing {
                Text(currentText)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(64)
                    .foregroundColor(foregroundColor)
            }
            Circle()
                .frame(
                    width: (geometry.size.width / 5),
                    height: (geometry.size.height / 5)
                )
                .position(
                    x: geometry.size.width / 2,
                    y: geometry.size.height / 2
                )
                .foregroundColor(foregroundColor)
                .phaseAnimator(
                    ViewStates.allCases,
                    trigger: currentViewState
                ) { content, phase in
                    content
                        .offset(y: phase.isBouncing ? -(geometry.size.height / 3) : 0.0)
                        .scaleEffect(phase.scale)
                } animation: { phase in
                    switch currentViewState {
                    case .Starting:
                            .bouncy(duration: 2)
                            .repeatCount(1, autoreverses: true)
                    case .Breathing:
                            .easeInOut(duration: 6)
                            .repeatCount(20, autoreverses: true)
                    case .Reviewing:
                            .bouncy(duration: 1)
                            .repeatCount(2, autoreverses: true)
                    }
                }
            TransitionButtonView(
                currentViewState: $currentViewState,
                currentTitleText: $currentText,
                foregroundColor: $foregroundColor,
                backgroundColor: $backgroundColor,
                accentColor: $accentColor
            )
            .position(
                x: geometry.size.width / 2,
                y: geometry.size.height - (geometry.size.height / 8)
            )
        }
        .background(backgroundColor)
    }
    
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
