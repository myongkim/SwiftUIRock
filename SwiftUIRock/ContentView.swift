//
//  ContentView.swift
//  SwiftUIRock
//
//  Created by Isaac Kim on 4/5/22.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["✊", "✋", "✌️"]
    @State private var computerChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    
    @State private var score = 0
    @State private var questionCount = 1
    @State private var showingResults = false
    
    
    var body: some View {
      
        VStack {
            Spacer()
            
            Text("Computer has played...")
                .font(.headline)
            
            Text(moves[computerChoice])
                .font(.system(size: 200))
            
            if shouldWin {
                Text("Which one win?")
                    .foregroundColor(.blue)
                    .font(.title)
        
            } else {
                Text("Which one loses?")
                    .font(.title)
                    .foregroundColor(.red)
            }
            
            HStack {
                ForEach(0..<3) { number in
                    Button(moves[number]) {
                        //handle button tap
                        play(choice: number)
                        
                    }
                    .font(.system(size: 80))
                }
                
            }
            
            Spacer()
            
            Text("Score: \(score)")
                .font(.subheadline)
            
            Spacer()
            
        }
        .alert("Game Over", isPresented: $showingResults) {
            Button("Play Again", action: reset)
        } message: {
            Text("Your score was \(score)")
        }
        
        
        
    }
    
    func play(choice: Int) {
        let winningMoves = [1,2,0]
        let didWin: Bool
        
        // More code to come
        if shouldWin {
            didWin = choice == winningMoves[computerChoice]
        } else {
            didWin = winningMoves[choice] == computerChoice
        }
        
        if didWin {
            score += 1
        } else {
            score -= 1
        }
        
        if questionCount == 10 {
            showingResults = true
        } else {
            computerChoice = Int.random(in: 0..<3)
            shouldWin.toggle()
            questionCount += 1
        }
    }
    
    func reset() {
        computerChoice = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        questionCount = 0
        score = 0
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
