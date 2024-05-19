//
//  ControlView.swift
//  AppTestTemp1
//
//  Created by Thanh Nguyen Viet on 19/05/2024.
//

import SwiftUI


struct ControlView: View {
    @Binding var isControlsVisible: Bool
    @Binding var showBrowse: Bool
    var body: some View {
        VStack {
            ControlVisibilityToggleButton(isControlsVisible: $isControlsVisible)
            
            Spacer()
            
            if isControlsVisible {
                ControlButtonBar(showBrowse: $showBrowse)
            }
        }
    }
}

struct ControlVisibilityToggleButton : View {
    @Binding var isControlsVisible: Bool
    var body: some View {
        HStack {
            Spacer()
            
            ZStack {
                Color.black.opacity(0.25)
                
                Button(action: {
                    print("Control Visibility Button is Pressed")
                    self.isControlsVisible.toggle()
                }) {
                    Image(systemName: self.isControlsVisible ? "rectangle" : "slider.horizontal.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                }
            }.frame(width: 50,height: 50)
                .cornerRadius(8.0)
        }
        .padding(.top,50)
        .padding(.trailing, 20)
    }
}

struct ControlButtonBar : View {
    @Binding var showBrowse : Bool
    var body: some View {
        HStack {
            //Most recently Button
            ControlButton(systemIconName: "clock.arrow.circlepath", action: {print("Most Recently Button is Pressed")})
            
            Spacer()
            //Browse Button
            ControlButton(systemIconName: "square.grid.2x2.fill", action: {
                print("Browse Button is Pressed")
                self.showBrowse.toggle()
            }).sheet(isPresented: $showBrowse , content: {
                BrowseView(showBrowse: $showBrowse)
            })
            
            
            Spacer()
            //Setting Button
            ControlButton(systemIconName: "slider.vertical.3", action: {print("Setting Button is Pressed")})
           }.frame(maxWidth : 500)
            .padding(30)
            .background(Color.black.opacity(0.25))
    }
    
    struct ControlButton: View {
        let systemIconName : String
        let action : () -> Void
        
        var body : some View  {
            Button(action: {
                self.action()
            }) {
                Image(systemName: systemIconName)
                    .font(.system(size: 35))
                    .foregroundColor(.white)
                    .buttonStyle(PlainButtonStyle())
            }
            .frame(width: 50,height: 50)
        }
    }
    
}

