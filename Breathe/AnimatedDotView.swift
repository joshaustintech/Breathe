import SwiftUI

let veryLightRed = Color(red: 1.0, green: 0.7, blue: 0.7)
let veryLightBlue = Color(red: 0.7, green: 0.7, blue: 1.0)
let veryDarkRed = Color(red: 0.125, green: 0.0, blue: 0.0)
let veryDarkBlue = Color(red: 0.0, green: 0.0, blue: 0.125)
let duration = 7

struct AnimatedDotView: View {
    @State private var yOffset: CGFloat = 0
    @State private var scale: CGFloat = 1.0
    @State private var viewText: String = "Just breathe with the dot."
    @State private var toggle: Bool = false
    @State private var backgroundColor: Color = veryDarkBlue
    @State private var foregroundColor: Color = veryLightRed
    
    private let timer = Timer.publish(every: TimeInterval(duration / 2), on: .main, in: .common).autoconnect()
    private let animationDuration: CGFloat = CGFloat(duration)
    
    func toggleNow() {
        toggle.toggle()
        
        if toggle {
            viewText = "breathe in..."
            backgroundColor = veryDarkBlue
            foregroundColor = veryLightBlue
        } else {
            viewText = "breathe out..."
            backgroundColor = veryDarkRed
            foregroundColor = veryLightRed
        }
    }

    var body: some View {
        VStack(spacing: 60) {
            Spacer()
            Text(viewText)
                .font(.largeTitle)
                .foregroundStyle(foregroundColor)
            GeometryReader { geometry in
                
                Circle()
                    .frame(width: 50 * scale, height: 50 * scale)
                    .foregroundColor(foregroundColor)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + yOffset)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: true)) {
                            yOffset = -(geometry.size.height / 3)
                            scale = 0.8
                        }
                        withAnimation(Animation.easeInOut(duration: animationDuration / 2).repeatForever(autoreverses: true)) {
                            scale = 1.8
                        }
                        toggleNow()
                    }
            }
            Text("01:58")
                .font(.headline.monospaced())
                .bold()
                .foregroundStyle(foregroundColor)
            Spacer()
            
        }
        .background(backgroundColor)
        .onReceive(timer) { _ in
            toggleNow()
        }
    }
    
    
}

struct AnimatedDotView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedDotView()
    }
}
