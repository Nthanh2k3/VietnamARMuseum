//
//  ContentView.swift
//  AppTestTemp1
//
//  Created by Thanh Nguyen Viet on 19/05/2024.
//
import SwiftUI
import RealityKit


struct ContentView: View {
    @EnvironmentObject var placementSettings : PlacementSettings
    @State private var isControlBarIsVisible: Bool = true
    @State private var showBrowse : Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            ARViewContainer()
            
            if (self.placementSettings.selectedModel == nil) {
            
                
                ControlView(isControlsVisible: $isControlBarIsVisible, showBrowse: $showBrowse)
                
            } else {
                PlacementView()
            }
            
            
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let arView = ARView(frame: .zero)
        
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PlacementSettings())
    }
}



