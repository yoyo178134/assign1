//
//  ContentView.swift
//  assign1
//
//  Created by 郭垣佑 on 2020/3/18.
//  Copyright © 2020 郭垣佑. All rights reserved.
//

import SwiftUI
struct Ear: Shape {
    func path(in rect:CGRect) -> Path {
        Path{(path) in
            path.move(to: CGPoint(x: 96, y: 90))
            path.addQuadCurve(to: CGPoint(x: 112, y: 10), control:
                CGPoint(x: 90, y: 30))
            path.addQuadCurve(to: CGPoint(x: 124, y: 90), control:
                CGPoint(x: 135, y: 5))
            //path.closeSubpath()
        }
    }
}

struct Earinside: Shape {
    func path(in rect:CGRect) -> Path {
        Path{(path) in
            path.move(to: CGPoint(x: 104, y: 90))
            path.addQuadCurve(to: CGPoint(x: 113, y: 30), control:
                CGPoint(x: 97, y: 29))
            path.addQuadCurve(to: CGPoint(x: 118, y: 90), control:
                CGPoint(x: 129, y: 29))
            path.closeSubpath()
        }
    }
}

struct Face: Shape {
    func path(in rect:CGRect) -> Path {
        Path{(path) in
            path.move(to: CGPoint(x: 164, y: 253))
            path.addQuadCurve(to: CGPoint(x: 242, y: 253), control:CGPoint(x: 200, y: 245))
            path.addQuadCurve(to: CGPoint(x: 251, y:397), control:CGPoint(x: 330, y: 325))
            path.addQuadCurve(to: CGPoint(x: 164, y:397), control:CGPoint(x: 207, y: 410))
            path.addQuadCurve(to: CGPoint(x: 164, y:253), control:CGPoint(x: 70, y: 325))
        }
    }
}

struct Mouse: Shape{
    func path(in rect:CGRect) -> Path {
        Path{(path) in
            path.move(to: CGPoint(x: 100, y: 100))
            path.addLine(to:CGPoint(x: 130, y: 100))
            path.addQuadCurve(to: CGPoint(x: 100, y: 100), control:CGPoint(x: 115, y: 150))
        }
    }
}

struct Foot: Shape{
    func path(in rect:CGRect) -> Path {
        Path{(path) in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: 0),
                              control: CGPoint(x: rect.width/2, y: rect.height/1.5))
            path.addQuadCurve(to: CGPoint(x: 0, y: 0),
                              control: CGPoint(x: rect.width/2, y: -rect.height/1.5))
            
        }
    }
}


struct ContentView: View {
    var body: some View {
        ZStack {
            Image("1").resizable().scaledToFill().frame(minWidth: 0, maxWidth: .infinity).edgesIgnoringSafeArea(.all)
            
            Ellipse().frame(width: 256, height: 40).offset(x: 0, y: -26)
            Group{  //ear
                Ear()
                    .fill(Color.yellow)
                    //.border(Color.black,width:5)
                    .overlay(Ear().stroke(lineWidth: 3))
                    .offset(x: 70, y: 165)
                
                Earinside()
                    .fill(Color(red:1,green:133/255,blue:156/255))
                    .offset(x: 70, y: 165)
                
                Ear()
                    .fill(Color.yellow)
                    .overlay(Ear().stroke(lineWidth: 3))
                    .rotationEffect(.degrees(10))
                    
                    .offset(x: 60, y: 175)
                
                Earinside()
                    .fill(Color(red:1,green:133/255,blue:156/255))
                    .offset(x: 90, y: 160)
                    .rotationEffect(.degrees(10))
                
                
            }
            
            Group{ //face
                
                Face()
                    .fill(Color.white)
                    .overlay(Face().stroke(lineWidth: 3))
                Circle()
                    .frame(width: 10, height: 10)
                    .offset(x: -30, y: -105)
                Circle()
                    .frame(width: 10, height: 10)
                    .offset(x: 20, y: -105)
                Ellipse()
                    .stroke(lineWidth:3)
                    .frame(width:20,height: 15)
                    .offset(x: -5, y: -85)
                Ellipse()
                    .fill(Color(red: 254/255, green: 198/255, blue: 204/255))
                    .frame(width:25,height: 17)
                    .offset(x: -50, y: -80)
                Ellipse()
                    .fill(Color(red: 254/255, green: 198/255, blue: 204/255))
                    .frame(width:25,height: 17)
                    .offset(x: 40, y: -80)
                ExtractedView(positionX:87, positionY:250)
                
            }
            
            Group{// foot
                FootView(positionX: 160, positionY:420, width: 50, height: 50)
                FootView(positionX: 250, positionY:420, width: 50, height: 50)
                
            }
            Text("是在哈囉")
                .foregroundColor(.white)
                .bold()
                .font(.system(size: 60))
            .offset(x: 0, y: 100)
            
            
            
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    var positionX: CGFloat = 0
    var positionY: CGFloat = 0
    var body: some View {
        Mouse()
            .fill(Color(red: 202/255, green: 62/255, blue: 45/255))
            .overlay( Mouse().stroke(lineWidth:3))
            .offset(x: positionX, y: positionY)
    }
}

struct FootView: View {
    var positionX: CGFloat = 0
    var positionY: CGFloat = 0
    var width: CGFloat = 0
    var height: CGFloat = 0
    var body: some View {
        Foot()
            .fill(Color.white)
            .frame(width: width, height: height)
            .position(x: positionX, y: positionY)
            .overlay(Foot().stroke(lineWidth: 3).frame(width: width, height: height).position(x: positionX, y: positionY))
        
    }
}
