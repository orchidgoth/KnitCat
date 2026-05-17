//
//  ContentView.swift
//  Knitting Counter
//
//  Created by Orchid_Code on 23.01.2026.
//

import SwiftUI
import UIKit
import AudioToolbox

struct CounterView: View {
    
    @State private var counter: Int = 0
    @State private var motifCounter: Int = 0
    @State private var incDecCounter: Int = 0
    
    var body: some View {
        
        ZStack {
            Image ("bubbles") // this is the background for the entire app
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer(minLength: 10)
                mainCounterView
                Spacer(minLength: 5)
                subCountersView
                Spacer(minLength: 10)
            }
            .padding()
        }
    }
    
    var mainCounterView: some View {
            
            VStack {
                
                Text("Row counter")
                    .font(.custom("MarkerFelt-Thin", size: 40))
                    .foregroundColor(Color(red: 0.996, green: 0.984, blue: 0.808))
                    .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 2)
                    .shadow(color: .white.opacity(0.7), radius: 2, x: -2, y: -2)
                
                Text("\(counter)")
                    .font(.custom("MarkerFelt-Thin", size: 120))
                    .foregroundColor(Color(red: 0.996, green: 0.984, blue: 0.808))
                
                    .shadow(color: .black.opacity(0.8), radius: 2, x: 2, y: 2)
                    .shadow(color: .white.opacity(0.5), radius: 5, x: -2, y: -2)
                
                HStack(spacing: 60) {
                    
                    Button (action: {
                        incrementCounter()
                        buttonVibration()
                    }) {
                        
                        ZStack {
                            
                            Image("pawButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                            
                            Text ("+")
                                .font(.custom("MarkerFelt-Thin", size: 60))
                                .frame(width: 80, height: 80)
                                .cornerRadius(80)
                                .foregroundColor(Color.white)
                                .offset(y: 20)
                        }
                    } //end of button 1
                    
                    
                    Button (action: {
                        decrementCounter()
                        buttonVibration()
                    })
                    {
                        
                        ZStack {
                            
                            Image("pawButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                            
                            Text ("-")
                            
                                .font(.custom("MarkerFelt-Thin", size: 60))
                                .frame(width: 80, height: 80)
                                .cornerRadius(80)
                                .foregroundColor(Color.white)
                                .offset(y: 20)
                        }
                    } // end of button 2
                }
                
                Button (action: {
                    clearCounter()
                    resetButtonVibration()
                })
                {
                    ZStack {
                        Image("resetButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 100)
                        
                        Text ("Reset")
                            .font(.custom("MarkerFelt-Thin", size: 30))
                            .frame(width: 80, height: 80)
                            .cornerRadius(80)
                            .foregroundStyle(Color.white)
                        
                    }
                } // end of Reset button
                
                
            }
            .padding()
            
        } // Main Counter View ends here
    
    var subCountersView: some View {
        
        HStack (spacing: 20) { // text+button sets aligned horizontally
            VStack(spacing: 10) { // text and button above each other
                
                Text("Motif\nrepeats")
                    .font(.custom("MarkerFelt-Thin", size: 30))
                    .foregroundColor(Color(red: 0.996, green: 0.984, blue: 0.808))
                    .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 2)
                    .shadow(color: .white.opacity(0.7), radius: 2, x: -2, y: -2)
                    .padding(.horizontal, 10)
                
                Button(action: {print ("peepeepoopoo this is a placeholder")
                })
                {
                    ZStack {
                        
                        Image("starButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        
                        Text ("+")
                            .font(.custom("MarkerFelt-Thin", size: 30))
                            .frame(width: 80, height: 80)
                            .cornerRadius(80)
                            .foregroundColor(Color.white)
                    }
                } // button ends here
                
            }
            
            
            VStack(spacing: 10) { // the other text and buttom below each other
                
                Text("Inc/dec\nrepeats")
                    .font(.custom("MarkerFelt-Thin", size: 30))
                    .foregroundColor(Color(red: 0.996, green: 0.984, blue: 0.808))
                    .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 2)
                    .shadow(color: .white.opacity(0.7), radius: 2, x: -2, y: -2)
                    .padding(.horizontal, 10)
                
                Button(action: {print ("peepeepoopoo this is a placeholder")
                })
                {
                    ZStack {
                        
                        Image("starButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                        Text ("+")
                            .font(.custom("MarkerFelt-Thin", size: 30))
                            .frame(width: 80, height: 80)
                            .cornerRadius(80)
                            .foregroundColor(Color.white)
                    }
                } // button ends here
                
            }
            
        }
    }
    
    private func incrementCounter() {
        counter += 1
    }
    
    private func decrementCounter() {
        if counter > 0 {
            counter -= 1
            
        }
    }
    
    private func clearCounter() {
        counter = 0
    }
    
    private func addMotifCounter() {
        
        
    }
    
    private func buttonVibration() {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        feedbackGenerator.impactOccurred()
        
    }
    
    private func resetButtonVibration() {
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
        feedbackGenerator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            feedbackGenerator.impactOccurred()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            feedbackGenerator.impactOccurred()
        }
    }
}

#Preview {
    CounterView()
}
