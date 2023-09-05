//
//  VibrationController.swift
//  Vibration editor
//
//  Created by Jonathan Chacón Barbero on 17/5/22.
//

import Foundation
import CoreHaptics

public struct VibrationPattern {
    public let intensity: Float
    public let sharpness: Float
    public let delay: Float
    public let times: Int
    
    public init(intensity: Float, sharpness: Float, delay: Float, times: Int) {
        self.intensity = intensity
        self.sharpness = sharpness
        self.delay = delay
        self.times = times
    }
}

public final class VibrationController {
    public static var shared = VibrationController()
    public var isEnabled: Bool = true
    private var engine: CHHapticEngine?
    public init() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
                    } catch {
            print("📳 Haptic events error: \(error.localizedDescription)")
        }
    }

    public func play(_ vibrationPattern: VibrationPattern) {
        play(intensity: vibrationPattern.intensity, sharpness: vibrationPattern.sharpness, delay: vibrationPattern.delay, times: vibrationPattern.times)
    }

    public func play(intensity: Float, sharpness: Float, delay: Float, times: Int) {
        guard isEnabled, CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        let intensityValue = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
        let sharpnessValue = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
        var timeValue: Float = 0
        for _ in stride(from: 1, to: times, by: 1) {
            timeValue+=delay
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensityValue, sharpnessValue], relativeTime: TimeInterval(timeValue))
            events.append(event)
        }
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let playerVibration = try engine?.makePlayer(with: pattern)
            try playerVibration?.start(atTime: 0)
        } catch {
            print("📳 Failed vibration: \(error.localizedDescription).")
        }
    }
    
}
