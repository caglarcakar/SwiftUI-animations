//
//  SunView.swift
//  animations
//
//  Created by Caglar Cakar on 18.01.2022.
//

import SwiftUI

struct SunView: View {
    var body: some View {
            
        ZStack {
            
            Circle()
                .strokeBorder(Color.white.opacity(0.6), lineWidth: 1)
                .frame(width: 80, height: 80, alignment: .center)
            .padding()
            Circle()
                .fill(Color("Cantaloupe"))
                .frame(width: 78, height: 78, alignment: .topTrailing)
            .padding()
            GeometryReader { geometry in
                
                ForEach(0..<8) { index in
                    RotatedSunLightView(angle: Angle(degrees: (Double(index) / Double(8)) * 360.0) )
                                    .scaleEffect(1.0 / 1, anchor: .center)
                                    .position(x: geometry.size.width / 2.0, y: geometry.size.height / 2)
                }
            }
            .frame(width: 100, height: 100)
        }
        
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView()
    }
}
