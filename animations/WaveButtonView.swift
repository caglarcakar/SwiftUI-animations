//
//  WaveButtonView.swift
//  animations
//
//  Created by Caglar Cakar on 7.01.2022.
//

import SwiftUI

struct WaveButtonView: View {
    
    @State private var pressed:Bool = false
    @State private var released:Bool = false
    @State private var wave:Bool = false
    
    @State private var scale:CGFloat = 1.0
    
    var body: some View {
        Button {
            
                
        } label: {
            Circle()
                .foregroundColor(Color.blue)
                .frame(width: 50, height: 50)
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged({ _ in
                    //on press
                    released = false
                    if !pressed {
                        pressed = true
                        pulseAnimation()
                    }
                    
                    
                })
                .onEnded({ _ in
                    //on release
                    if pressed {
                        released = true
                    }
                    pressed = false
                    releaseAnimation()
                })
            )
        .scaleEffect(scale)
        .animation(.easeInOut(duration: 0.2), value: scale)
        .background {
            Circle()
                .stroke(lineWidth: wave ? 0.5 : 0.8)
                .opacity(wave ? 0 : 0.8)
                .foregroundColor(Color.blue)
                
                .scaleEffect(wave ? 12.0 : 1.0)
                .frame(width: 10, height: 10)
                .animation(wave ? .easeOut(duration: 0.3) : .none, value: wave)
                
        }
        .buttonStyle(CustomButtonStyle())

    }
    
    private func pulseAnimation(){
        if released { return }
        scale = 0.70
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            scale = 0.75
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                pulseAnimation()
            }
        }
    }
    
    private func releaseAnimation(){
        scale = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            scale = 1
            wave = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                wave = false
            }
        }
    }
}

struct WaveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WaveButtonView()
    }
}

struct CustomButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
  }
}
