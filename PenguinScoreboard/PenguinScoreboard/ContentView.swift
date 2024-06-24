//
//  ContentView.swift
//  PenguinScoreboard
//
//  Created by KR on 24/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("The Penguin Scoreboard")
                Text("Designed to be the best scoreboard")
                NavigationLink{
                    ChooseSport()
                } label: {
                    Text("Click to go choose a preset sport")
                }
                NavigationLink{
                    ScoreboardView()
                } label: {
                    Text("Click to go to the Scoreboard")
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
