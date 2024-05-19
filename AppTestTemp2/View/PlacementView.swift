//
//  PlacementView.swift
//  AppTestTemp2
//
//  Created by Thanh Nguyen Viet on 19/05/2024.
//

import SwiftUI
import RealityKit
import Combine

struct PlacementButton : View {
    let systemIconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action : {
            self.action()
        } ) {
            Image(systemName: systemIconName)
                .font(.system(size:50, weight: .light, design: .default))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
        }
        .frame(width: 75,height: 75)
    }
}


struct PlacementView : View {
    
        @EnvironmentObject var placementSettings : PlacementSettings
    
    
    var body: some View {
        HStack {
            Spacer()
            PlacementButton(systemIconName: "xmark.circle.fill", action: {
                print("Cancel Placement Button Pressed")
                self.placementSettings.selectedModel = nil
            })
            
            Spacer()
            
            PlacementButton(systemIconName: "checkmark.circle.fill", action: {
                print("Confirm Placement Button Pressed")
                
                
                self.placementSettings.selectedModel = self.placementSettings.selectedModel
                
                self.placementSettings.selectedModel = nil
            })
            
            Spacer()
        }.padding(.bottom,40)
    }
}
