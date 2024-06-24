//
//  ChooseSport.swift
//  PenguinScoreboard
//
//  Created by Trevor Toh Hong Rui on 24/6/24.
//
//  Edited by Dylan
//

import SwiftUI

struct ChooseSport: View {
    @State private var selectedSport: String = ""

    let sports = ["Basketball", "Handball", "Badminton", "Baseball", "Soccer"]

    var body: some View {
        VStack {
            Text("Choose a sport")
               .font(.largeTitle)
               .fontWeight(.bold)
               .padding()

            ForEach(sports, id: \.self) { sport in
                Button(action: {
                    self.selectedSport = sport
                }) {
                    HStack {
                        if sport == "Basketball" {
                            Image(systemName: "figure.basketball")
                               .font(.largeTitle)
                        } else if sport == "Handball" {
                            Image(systemName: "figure.handball")
                               .font(.largeTitle)
                        } else if sport == "Badminton" {
                            Image(systemName: "figure.badminton")
                               .font(.largeTitle)
                        } else if sport == "Baseball" {
                            Image(systemName: "figure.baseball")
                               .font(.largeTitle)
                        } else if sport == "Soccer" {
                            Image(systemName: "figure.soccer")
                               .font(.largeTitle)
                        }
                        Text(sport)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                    }
                   .padding(20)
                   .background(Color.gray.opacity(0.1))
                   .cornerRadius(12.5)
                }
            }

            Text("Selected sport: \(selectedSport)")
               .padding()
        }
    }
}

struct ChooseSport_Previews: PreviewProvider {
    static var previews: some View {
        ChooseSport()
    }
}
