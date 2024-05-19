//
//  AppTestTemp2App.swift
//  AppTestTemp2
//
//  Created by Thanh Nguyen Viet on 19/05/2024.
//

import SwiftUI

@main
struct AppTestTemp2App: App {
    @StateObject var placementSettings = PlacementSettings()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(placementSettings)
            
        }
    }
}
