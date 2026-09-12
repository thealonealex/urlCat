//
//  ContentView.swift
//  urlCat
//
//  Created by Alex on 7/9/26.
//

import SwiftUI
import OnPasteboardChange

struct MenubarView: View {
    @State var cleaningEnabled:Bool = true
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let pasteboard = NSPasteboard.general
    let cleanList:[String] = ["si", "stkn", "utm_source"]
    var body: some View {
        VStack {
            Button(cleaningEnabled ? "Disable url cleaning" : "Enable url cleaning"){
                cleaningEnabled.toggle()
            }
            Divider()
            Text("Version \(appVersion ?? "unknown")")
                .font(.subheadline)
            Button("Show Settings"){
                //code
            }.keyboardShortcut(",", modifiers: .command)
            Divider()
            Button("Quit urlCat"){
                NSApp.terminate("urlCat")
            }.keyboardShortcut("Q", modifiers: .command)
        }.onPasteboardChange {
            if cleaningEnabled{
                let lastClipboardItem:String? = pasteboard.string(forType: .string)
                let clipboardItem = lastClipboardItem ?? "empty"
                print(clipboardItem)
                let cleanedClipboard = clipboardItem.clean(cleanList: cleanList)
                //TODO: code to clean the pasteboard content
                //you cannot seem to be able to remove stuff from the system clipboard, so we'll have to append new objects instead
                if cleanedClipboard != clipboardItem && clipboardItem.starts(with: "http"){
                    print(cleanedClipboard)
                    pasteboard.clearContents()
                    pasteboard.writeObjects([NSString(string: cleanedClipboard)])
                    BarNotificationCenter.shared.show(popupText: "Cleaned link", popupSymbol: "bubbles.and.sparkles.fill")
                }
            }
        }
        .padding()
    }
}

#Preview {
    MenubarView()
}
