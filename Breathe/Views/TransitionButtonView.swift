//
//  TransitionButtonView.swift
//  Breathe
//
//  Created by Joshua Austin on 3/11/24.
//

import SwiftUI

struct TransitionButtonView: View {
    
    @Binding var currentViewState: ViewStates
    @Binding var currentTitleText: String
    @Binding var foregroundColor: Color
    @Binding var backgroundColor: Color
    @Binding var accentColor: Color
    @State var currentButtonText: String = "Begin"
    
    var body: some View {
        Button(currentButtonText) {
            switch currentViewState {
            case .Starting:
                currentViewState = .Breathing
                currentButtonText = "Cancel"
                
            case .Breathing:
                currentViewState = .Reviewing
                currentTitleText = "Good job!"
                currentButtonText = "Done"
                foregroundColor = CustomColors.VeryLightGreen
                backgroundColor = CustomColors.VeryDarkGreen
                accentColor = CustomColors.VeryLightBlue
                
            case .Reviewing:
                currentViewState = .Starting
                currentTitleText = "2 Minute Breathing Exercise"
                currentButtonText = "Begin"
                foregroundColor = CustomColors.VeryLightBlue
                backgroundColor = CustomColors.VeryDarkBlue
                accentColor = CustomColors.VeryLightRed
            }
        }.foregroundColor(accentColor)
    }
}

struct TransitionButtonView_Previews : PreviewProvider {
    @State static var currentViewState: ViewStates = .Starting
    @State static var currentTitleText: String = "2 Minute Breathing Exercise"
    @State static var foregroundColor: Color = CustomColors.VeryLightBlue
    @State static var backgroundColor: Color = CustomColors.VeryDarkBlue
    @State static var accentColor: Color = CustomColors.VeryLightRed
    
    
    static var previews: some View {
        TransitionButtonView(
            currentViewState: $currentViewState,
            currentTitleText: $currentTitleText,
            foregroundColor: $foregroundColor,
            backgroundColor: $backgroundColor,
            accentColor: $accentColor
        )
    }
}
