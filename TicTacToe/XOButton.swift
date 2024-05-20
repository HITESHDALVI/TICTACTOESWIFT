//
//  XOButton.swift
//  TicTacToe
//
//  Created by Hitesh Dalvi on 07/05/24.
//

import SwiftUI

struct XOButton: View {
    @Binding var letter:String
    @State private var degrees = 0.0
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width:120,height: 120)
                .foregroundColor(.blue)
            Circle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                .foregroundColor(.white)
            Text(letter)
                .font(.system(size: 50))
                .bold()
            
        }
        .rotation3DEffect(
            .degrees(degrees),
            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
        )
        .simultaneousGesture(
         TapGesture()
            .onEnded{ _ in
                withAnimation(.easeIn(duration: 0.25))
                {
                    self.degrees -= 180
                }
            }
         )
    }
}

#Preview {
    XOButton(letter: .constant("X"))
}
