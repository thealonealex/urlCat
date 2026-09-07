//
//  urlCatApp.swift
//  urlCat
//
//  Created by Alex on 7/9/26.
//

import SwiftUI

@main
struct urlCatApp: App {
    @State
    var toggleState:Bool = true
    var body: some Scene {
        
        MenuBarExtra("Utility App", systemImage: "sparkle.text.clipboard") {
               MenubarView()
        }
    }
}
