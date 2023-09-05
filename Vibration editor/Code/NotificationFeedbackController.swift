//
//  NotificationFeedbackController.swift
//  Vibration editor
//
//  Created by Jonathan Chacón Barbero on 5/9/23.
//

import UIKit

final class NotificationFeedbackController {
    static let shared: NotificationFeedbackController = NotificationFeedbackController()
    
    private init() { }
    
    func play(type: UINotificationFeedbackGenerator.FeedbackType) {
        let feedbackGenerator = UINotificationFeedbackGenerator()
        feedbackGenerator.notificationOccurred(type)
    }
    
    func playImpact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: style)
        feedbackGenerator.impactOccurred()
    }
}
