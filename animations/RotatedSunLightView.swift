//
//  RotatedSunLightView.swift
//  animations
//
//  Created by Caglar Cakar on 18.01.2022.
//

import SwiftUI

struct RotatedSunLightView: View {
    
    let angle:Angle
    var body: some View {
        Triangle()
            .fill(Color("Cantaloupe"))
            .frame(width: 10, height: 10)
            .padding(.bottom,100)
            //.padding(-60)
            .rotationEffect(angle, anchor: .center)
    }
}

struct RotatedSunLightView_Previews: PreviewProvider {
    static var previews: some View {
        RotatedSunLightView(angle: Angle(degrees: 135))
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY * 3 / 4))
        }
    }
    
}

