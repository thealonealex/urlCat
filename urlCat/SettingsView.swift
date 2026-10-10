//
//  SettingsView.swift
//  urlCat
//
//  Created by Alex on 10/10/26.
//

import SwiftUI

struct SettingsView: View {
    //UserDefaults & AppStorage
    var body: some View {
        //TODO: Use a TabView
        TabView{
            Tab("General", systemImage: "gear"){
                Text("Hohoho, it's me, lancer!")
                Text("Treat me like one of your ITEMs")
            }
        }
        .scenePadding()
        .frame(maxWidth: 350, minHeight: 100)
    }
}

#Preview {
    SettingsView()
}
