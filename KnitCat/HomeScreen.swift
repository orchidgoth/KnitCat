//
//  HomeScreen.swift
//  Knitting Counter
//
//  Created by Orchid_Code on 28.01.2026.
//

import SwiftUI

struct HomeScreen: View {
    
    @Binding var counter: Int
    
    @State private var newProjectName = ""
    
    @State private var projects: [Project] = [
        Project(projectName: "Something soft", rowCount: 12, repeatCount: 4)
    ]
    
    var body: some View {
        
        //NavigationStack {

            
            ZStack {
                
                Image("bubbles")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                
                VStack(alignment: .center, spacing: 20) {
                    
                    Text ("New project")
                        .padding(.top, 180)
                        .font(.custom("MarkerFelt-Thin", size: 50))
                        .foregroundColor(Color(red: 0.996, green: 0.984, blue: 0.808))
                        .shadow(color: .black.opacity(0.5), radius: 2, x: 2, y: 2)
                        .shadow(color: .white.opacity(0.7), radius: 2, x: -2, y: -2)
                    
                    TextField("I'm making...", text: $newProjectName)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 320)
                        .shadow(color: .black.opacity(0.5), radius: 2)
                    
                    Button ("Add project") {
                        let newProject = Project(projectName: newProjectName, rowCount: 0, repeatCount: 0)
                        projects.append(newProject)
                    }
                    
                    List (projects, id: \.projectName) { myProject in
                        HStack {
                            
                            Text(myProject.projectName)
                                .foregroundColor(.pink)
                                .font(.custom("MarkerFelt-Thin", size: 30))
                        }
                        .listRowBackground(Color.clear)
                    }
                        .scrollContentBackground(.hidden)
                        .listStyle(.plain)
                        .frame(width: 300)
                    }
                    
                    
                    /* Text("\(counter)")
                     .font(.custom("MarkerFelt-Thin", size: 80))
                     .foregroundColor(Color(red: 0.996, green: 0.984, blue: 0.808))
                     
                     .shadow(color: .black.opacity(0.8), radius: 2, x: 2, y: 2)
                     .shadow(color: .white.opacity(0.5), radius: 5, x: -2, y: -2)*/
                    
                    
                }
            }
            
        }
//}

// this is always separated like this
#Preview {
    HomeScreen(counter: .constant(0))
}
