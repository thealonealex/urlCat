//
//  ContentView.swift
//  urlCat
//
//  Created by Alex on 7/9/26.
//

import SwiftUI
import OnPasteboardChange

struct MenubarView: View {
    @State var toggleState:Bool = true
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let pasteboard = NSPasteboard.general
    var body: some View {
        VStack {
            Button(toggleState ? "Disable url cleaning" : "Enable url cleaning"){
                toggleState.toggle()
            }
            Divider()
            Text("Version \(appVersion ?? "beta")")
                .font(.subheadline)
            Button("Show Settings"){
                //code
            }.keyboardShortcut(",", modifiers: .command)
            Divider()
            Button("Quit urlCat"){
                //code
            }.keyboardShortcut("Q", modifiers: .command)
        }.onPasteboardChange {
            print(pasteboard.string(forType: .string) ?? "empty")
            //code to clean the pasteboard content
        }
        .padding()
    }
}

#Preview {
    MenubarView()
}
