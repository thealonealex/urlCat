//
//  BarNotificationAppleView.swift
//  urlCat
//
//  Created by Alex on 8/9/26.
//
//  Modified from BarNotificationAppleView.swift
//  NothingBar
//
//  Created by Artem Belkov on 21.02.2026.
//

import SwiftUI

struct BarNotificationAppleView: View {
    var popupText:String
    var popupSymbol:String

    var body: some View {
        HStack{
            Image(systemName: popupSymbol)
                .font(.title3)
                .contentTransition(.symbolEffect(.replace))
            Text(popupText)
        }
        .frame(maxWidth: 300)
        .padding(10)
        .background {
            if #available(macOS 26.0, *) {
                Capsule()
                    .fill(.regularMaterial.opacity(0.3))
                    .overlay {
                        Capsule()
                            .strokeBorder(.white.opacity(0.12), lineWidth: 1)
                    }
                    .glassEffect(.regular)
            } else {
                Capsule()
                    .fill(.regularMaterial)
                    .overlay {
                        Capsule()
                            .strokeBorder(.white.opacity(0.12), lineWidth: 1)
                    }
            }
        }
    }
}

#Preview{
    let text = "Example"
    let symbol = "bubbles.and.sparkles.fill"
    BarNotificationAppleView(popupText: text, popupSymbol: symbol)
}
