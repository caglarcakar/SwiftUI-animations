//
//  ContentView.swift
//  animations
//
//  Created by Caglar Cakar on 6.01.2022.
//

import SwiftUI

//struct ContentView: View {
//
//    @Binding var ani:Bool
//
//    var body: some View {
//        Circle()
//            .stroke(lineWidth: 5)
//            .frame(width: 50, height: 50)
//            .scaleEffect(ani ? 2 : 1)
//            .animation(Animation.easeOut(duration: 1.0), value: ani)
//            .padding()
//    }
//}

struct TapMeButtonView: View {
    @State private var hidden = false
    @State private var wave = false
    
        var body: some View {
            Button(action: {
               
            }, label: {
                Circle()
                    .frame(width: 50, height: 50)
            })
            .scaleEffect(hidden ? 2.0 : 1.0)
            //.opacity(hidden ? 0.5 : 1)
            .foregroundColor(Color.blue)
            .animation(.easeOut(duration: 0.3), value: hidden)
            .onAppear(perform: continuousAnimation)
            .background {
                Circle()
                    .stroke(lineWidth: wave ? 1 : 0.5)
                    .foregroundColor(Color.blue)
                    .opacity(wave ? 0 : 1)
                    .scaleEffect(wave ? 4 : 0.8)
                    .animation(wave ? .easeOut(duration: 1.8) : .none, value: wave)
            }
            .buttonStyle(CustomButtonStyle())
       }
    
    private func continuousAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            hidden.toggle()
            wave.toggle()
            self.continuousAnimation()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TapMeButtonView()
            .previewLayout(.sizeThatFits)
    }
}
