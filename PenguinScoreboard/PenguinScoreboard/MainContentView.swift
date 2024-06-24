//
//  MainContentView.swift
//  PenguinScoreboard
//
//  Created by KR on 24/6/24.
//
//  This is the main intro screen
//
//

import SwiftUI

struct MainContentView: View {
    @State private var animate = false
    @State private var animate2 = false

    @State private var titleText = "Harness the power of counters."
    @State private var subtitleText = "Ensure that you never lose track of a single score again."
    @State private var pageNumber = 1
    @State private var currentIcon = "lasso.badge.sparkles"
    @State private var interactiveDismissEnabled = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                VStack {
                    Image(systemName: currentIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.teal)
                        .padding()
                        .symbolEffect(.pulse, value: animate2)
                        .symbolEffect(.bounce, value: animate)
                        .contentTransition(.symbolEffect(.replace))
                    Text(titleText)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .multilineTextAlignment(.center)
                    Text(subtitleText)
                        .font(.body)
                }
                .padding(.bottom, 200)
                Spacer()

                Button(action: {
                    if pageNumber == 1 {
                        titleText = "A template for every sport"
                        subtitleText = "Easily choose between sports and get your counter template for that sport."
                        currentIcon = "figure.badminton"

                        Task { @MainActor in
                            try await Task.sleep(for: .seconds(1))
                            currentIcon = "figure.basketball"
                            try await Task.sleep(for: .seconds(1))
                            currentIcon = "figure.handball"
                            try await Task.sleep(for: .seconds(1))
                            currentIcon = "figure.baseball"
                        }
                    } else if pageNumber == 2 {
                        print("ok")
                    }
                    pageNumber += 1
                }) {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        .bold()
                }
                .onAppear {
                    animate.toggle()
                }
            }
            .padding()
            .onAppear {
                Task { @MainActor in
                    try await Task.sleep(for: .seconds(1))
                    animate2.toggle()
                }
            }
            .toolbar {
                
                if pageNumber == 3 {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Skip") {
                            
                            interactiveDismissEnabled = true
                        }
                    }
                }
            }
            .background(Color.white)
        }
        .background(Color.white)
        .interactiveDismissDisabled(!interactiveDismissEnabled)
    }
}

#Preview {
    MainContentView()
}
