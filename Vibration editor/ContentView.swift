//
//  ContentView.swift
//  Vibration editor
//
//  Created by Jonathan Chacón Barbero on 15/5/22.
//

import SwiftUI

struct ContentView: View {
    @State var intensity: String = "1.0"
    @State var sharpness: String = "1.0"
    @State var delay: String = "0.5"
    @State var times: String = "5"
    var body: some View {
        Text("Vibration editor".localized)
            .font(.title)
            .accessibilityAddTraits(.isHeader)
            .padding()
            
        VStack(alignment: .center, spacing: 10) {
            FieldView(label: "Intensity".localized, text: $intensity)
            FieldView(label: "Sharpness".localized, text: $sharpness)
            FieldView(label: "Delay".localized, text: $delay)
            FieldView(label: "Times".localized, text: $times)
        }
        .padding()
        
        Button(action: { makeVibration() }) {
            Text("Vibrate")
        }
    }
    
    private func makeVibration() {
        let fIntensity = Float(intensity)
        let fSharpness = Float(sharpness)
        let fDelay = Float(delay)
        let iTimes = Int(times)
        guard let fIntensity = fIntensity,
                let fSharpness = fSharpness, let fDelay = fDelay,
              let iTimes = iTimes else { return }
        let pattern: VibrationPattern =
        VibrationPattern(intensity: fIntensity,
                         sharpness: fSharpness,
                         delay: fDelay,
                         times: iTimes)
        VibrationController.shared.play(pattern)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
