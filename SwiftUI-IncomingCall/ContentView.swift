//
//  ContentView.swift
//  SwiftUI-IncomingCall
//
//  Created by Sreytouch(Jessica) on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isCalling = false
    let easeGently = Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
    let pulsingColor = #colorLiteral(red: 0, green: 0.3725490196, blue: 1, alpha: 1)
    
    var body: some View {
        ZStack{
            Spacer()
            
            VStack {
                ZStack{
                    //Outer
                    Circle()
                        .fill(Color(pulsingColor).gradient)
                        .frame(width: 172, height: 172)
                        .opacity(0.1)
                        .scaleEffect(isCalling ? 0.8 : 1.2)
                        .zIndex(isCalling ? 0 : 1)
                        .animation(easeGently.delay(0.2), value: isCalling)
                    
                    //Middle
                    Circle()
                        .fill(Color(pulsingColor).gradient)
                        .frame(width: 172, height: 172)
                        .opacity(0.2)
                        .scaleEffect(isCalling ? 0.7 : 1.1)
                        .zIndex(isCalling ? 0 : 3)
                        .animation(easeGently.delay(0.4), value: isCalling)
                    
                    //Inner
                    Circle()
                        .fill(Color(pulsingColor).gradient)
                        .frame(width: 172, height: 172)
                        .opacity(0.3)
                        .zIndex(isCalling ? 0 : 3)
                        .animation(easeGently.delay(0.6), value: isCalling)
                    
                    Image(.myPic)
                        .resizable()
                        .frame(width: 172, height: 172)
                        .hueRotation(Angle(degrees: isCalling ? 0 : .random(in: 0...120)))
                        .clipShape(Circle())
                        .opacity(isCalling ? 1 : 0.1)
                        .scaleEffect(isCalling ? 1 : 0.5)
                        .animation(easeGently, value: isCalling)
                }
                .onAppear{
                    withAnimation{
                        isCalling.toggle()
                    }
                }
                
                Text("Jessica Lang")
                    .font(.title)
                
                HStack(alignment: .bottom, spacing: 0){
                    Text("Calling")
                    Image(systemName: "ellipsis")
                        .symbolEffect(.variableColor.iterative.reversing)
                        .foregroundStyle(EllipticalGradient(colors:[Color(pulsingColor), .green], center: .center, startRadiusFraction: 0.0, endRadiusFraction: 0.5))
                        .hueRotation(.degrees(isCalling ? 0 : 300))
                        .animation(easeGently.delay(0.6), value: isCalling)
                }
                .font(.title3)
                .bold()
            }
            .padding()
            
            Spacer()
            
            HStack{
                Image(systemName: "phone.down.circle.fill")
                    .symbolRenderingMode(.multicolor)
                    .font(.system(size: 80))
                
                Spacer()
                
                Image(systemName: "phone.circle.fill")
                    .symbolRenderingMode(.multicolor)
                    .font(.system(size: 80))
            }
            .padding(EdgeInsets(top:0, leading: 48, bottom: 16, trailing: 48))
        }
        .toolbar{
            //leading navigation iteams
            ToolbarItemGroup(placement: .navigationBarLeading){
                Button{
                    print("Pressed back arrow button")
                } label: {
                    Image(systemName: "chevron.backward")
                }
                
                Button("Messages"){
                    print("Pressed messages button")
                }
            }
            
            //trailing navigation item
            ToolbarItemGroup(placement: .navigationBarTrailing){
                Button{
                    print("Pressed person button")
                } label: {
                    Image(systemName: "person.3.fill")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
