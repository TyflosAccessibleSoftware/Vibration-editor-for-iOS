//
//  String+Localization.swift
//  Vibration editor
//
//  Created by Jonathan Chacón Barbero on 17/5/22.
//

import Foundation

extension String {
    var localized: String {
        let str = NSLocalizedString(self, comment: self)
        return str
    }
    
    func localize(string: String, comment : String) -> String {
        return NSLocalizedString(string, comment: comment)
    }
}
