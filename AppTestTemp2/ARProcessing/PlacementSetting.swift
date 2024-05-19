//
//  PlacementSetting.swift
//  AppTestTemp2
//
//  Created by Thanh Nguyen Viet on 19/05/2024.
//

import SwiftUI
import RealityKit
import Combine


class PlacementSettings : ObservableObject {
    //When the user selects a model in BrowseView, this property is set
    @Published var selectedModel : Model? {
        willSet(newValue) {
            print("Setting selectedModel to \(String(describing: newValue?.name))")
        }
    }
    //When the user taps confirm in PlacementView, the value of selectedModel is assigned to confirmation mode()
    @Published var confirmedModel: Model? {
        willSet(newValue) {
            guard let model = newValue else {
                print("Clearing confirmed model")
                return
            }
            
            print("Setting confirmedModel to \(model.name)")
        }
    }
}
