//
//  ContentView.swift
//  TicTacToe
//
//  Created by Hitesh Dalvi on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["","","","","","","","",""]
    @State private var endGameText = "Tic Tac Toe"
    @State private var gameEnded = false
    private var ranges = [(0..<3), (3..<6), (6..<9)]
    var body: some View {
        VStack {
           Text(endGameText)
                .alert(endGameText,isPresented: $gameEnded){
                    Button("Reset",role: .destructive, action: resetGame)
                }
            Spacer()
            
            ForEach(ranges, id: \.self){ range in
                HStack{
                    ForEach(range, id: \.self){ i in
                        XOButton(letter: $moves[i])
                            .simultaneousGesture(
//                            .gesture(
                                TapGesture()
                                .onEnded{ _ in
                                    playerTap(index: i)
                                })
                    }
                }
            }
            Spacer()
            Button("Reset",role: .destructive, action: resetGame)        }
        .padding()
    }
    
    func playerTap(index: Int){

        if moves[index] == "" {
            moves[index] = "X"
            botMove()
        }
        
    }
    
    func botMove(){
        var availableMoves:[Int]=[]
        var movesLeft = 0
        for move in moves {
            if move == "" {
                availableMoves.append(movesLeft)
            }
            movesLeft += 1
        }
        if availableMoves.count != 0 {
            moves[availableMoves.randomElement()!] = "O"
        }
        
    }
    
    func resetGame(){
        endGameText = "Tic Tac Toe"
        moves = ["","","","","","","","",""]
  
    }
}

#Preview {
    ContentView()
}
