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
            Text("Version \(appVersion ?? "unknown")")
                .font(.subheadline)
            Button("Show Settings"){
                //code
            }.keyboardShortcut(",", modifiers: .command)
            Divider()
            Button("Quit urlCat"){
                //code
            }.keyboardShortcut("Q", modifiers: .command)
        }.onPasteboardChange {
            let lastClipboardItem:String? = pasteboard.string(forType: .string)
            print(lastClipboardItem ?? "empty")
            BarNotificationCenter.shared.show(popupText: "Copied url", popupSymbol: "document.on.clipboard")
            //TODO: code to clean the pasteboard content
            //you cannot seem to be able to remove stuff from the system clipboard, so we'll have to append new objects instead
        }
        .padding()
    }
}

#Preview {
    MenubarView()
}
