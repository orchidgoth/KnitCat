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

    var body: some View {
        
        ZStack {
            
            Image ("bubbles")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack (spacing: 20) {
                //the vertical layout of the entire app screen
                
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
                            
                            Image("starButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                            
                            Text ("+")
                                .font(.custom("MarkerFelt-Thin", size: 60))
                                .frame(width: 80, height: 80)
                                .cornerRadius(80)
                                .foregroundColor(Color.white)
                            
                            
                        }
                    }
                    
                    //end of button 1
                    
                    
                    Button (action: {
                        decrementCounter()
                        buttonVibration()
                    })
                    {
                        
                        ZStack {
                            
                            Image("starButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            
                            
                            Text ("-")
                            
                                .font(.custom("MarkerFelt-Thin", size: 60))
                                .frame(width: 80, height: 80)
                                .cornerRadius(80)
                                .foregroundColor(Color.white)
                        }
                    }
                    
                    // end of button 2
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
                }
            }
            .padding()
            
        }
    }
    
    private func incrementCounter() {
        counter += 1
    }
    
    private func decrementCounter() {
        if counter > 0 {
            counter -= 1
            //} else {
            //  return
            
        }
    }
    
    private func clearCounter() {
        counter = 0
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
