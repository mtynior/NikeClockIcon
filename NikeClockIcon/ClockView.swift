//
//  ClockView.swift
//  NikeClockIcon
//
//  Created by Michal on 28/02/2021.
//

import SwiftUI

struct ClockView: View {
    @State var currentTime: (hour: String, minute: String) = ("", "")
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let backgroundColor = Color.black
    let clockColor = Color(red: 0.841, green: 1.0, blue: 0.257, opacity: 1)
    
    var body: some View {
        GeometryReader { parent in
            let fontSize = parent.size.height * 0.4
            let clockFont = Font.custom("Futura-Bold", size: fontSize)
            let hSpacing = fontSize * 0.25

            VStack {
                Text(currentTime.hour)
                    .padding(.bottom, -hSpacing)
                Text(currentTime.minute)
                    .padding(.top, -hSpacing)
            }
            .font(clockFont)
            .frame(idealWidth: parent.size.width, maxWidth: .infinity, idealHeight: parent.size.height, maxHeight: .infinity)
            .foregroundColor(clockColor)
            .background(backgroundColor)
            .cornerRadius(parent.size.height * 0.2)
            .shadow(radius: 3)
        }
        .onReceive(timer) { currentDate in
            let components = Calendar.current.dateComponents([.hour, .minute], from: currentDate)
            let hour = components.hour ?? 0
            let minute = components.minute ?? 0
            
            currentTime = (String(format: "%02d", hour), String(format: "%02d", minute))
        }
        .padding(10)
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
