//
//  FieldView.swift
//  Vibration editor
//
//  Created by Jonathan Chacón Barbero on 17/5/22.
//

import SwiftUI

struct FieldView: View {
    @State var label: String
    @Binding var text: String
    var body: some View {
        HStack {
            Text(label)
                .accessibilityHidden(true)
            TextField("", text: $text)
                .accessibilityLabel(label)
        }
        .padding()
    }
}
