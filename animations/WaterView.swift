//
//  WaterView.swift
//  animations
//
//  Created by Caglar Cakar on 16.01.2022.
//

import SwiftUI

struct WaterView: View {
    
    @State private var animate:Bool = false
    @State private var animate2:Bool = false
    @State private var animate3:Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            ZStack{
                WaterShape(controlPointY: animate ? 0.35 : 0.65).fill(Color("Ocean").opacity(0.9))
                    .frame(width: UIScreen.screenWidth + 100, height: 200)
                    .offset(x: animate ? -10 : 30, y: -10)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 4).repeatForever()) {
                                        animate.toggle()
                        }
                    }
                WaterShape(controlPointY: animate2 ? 0.65 : 0.35).fill(Color("Sky").opacity(0.9))
                    .frame(width: UIScreen.screenWidth + 100, height: 200)
                    .offset(x: animate2 ? -30 : 30, y: 0)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
                                        animate2.toggle()
                        }
                    }
                WaterShape(controlPointY: animate3 ? 0.35 : 0.65).fill(Color("Aqua").opacity(0.9))
                    .frame(width: UIScreen.screenWidth + 100, height: 200)
                    .offset(x: animate3 ? -20 : 30, y: 0)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 3).repeatForever()) {
                                        animate3.toggle()
                        }
                    }
            }
        }
    }
}

struct WaterView_Previews: PreviewProvider {
    static var previews: some View {
        WaterView()
    }
}

struct WaterShape: Shape {
    
    var controlPointY: CGFloat
    
    var animatableData: CGFloat {
            get { controlPointY }
            set { controlPointY = newValue }
        }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.midX / 2 , y: rect.midY),
                control: CGPoint(
                    x: rect.width / 8,
                    y: rect.height * controlPointY))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(
                    x: rect.midX * 0.75,
                    y: rect.height * (1 - controlPointY)))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX * 0.75, y: rect.midY),
                control: CGPoint(
                    x: rect.width * 5 / 8,
                    y: rect.height * controlPointY))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(
                    x: rect.width * 7 / 8,
                    y: rect.height * (1 - controlPointY)))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
    
}
