//
//  HomeView.swift
//  BlessedTeam
//
//  Created by Monica Butarbutar on 26/05/23.
//

import SwiftUI

struct HomeView: View {
    @State var isPreparationViewactive: Bool = false
    
    var body: some View {
        ZStack {
            Image("background")
            VStack {
                Image("paper")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("No User Interviews")
                    .bold()
                Text("User Interviews you've added will appear here")
            }
            .offset(x:0, y:100)
            
            HStack {
                Rectangle()
                    .shadow(color: .gray, radius: 5, x: 10, y: 5)
                    .frame(width: 308, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .overlay(
                        VStack {
                            Text("0")
                            Text("interviews have been conducted")
                        }
                        .foregroundColor(.green)
                        .font(.system(size: 25))
                    )
                Rectangle()
                    .shadow(color: .gray, radius: 5, x: 10, y: 5)
                    .frame(width: 308, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .overlay(
                        VStack {
                            Text("0")
                            Text("interviews has not been conducted")
                        }
                        .foregroundColor(.blue)
                        .font(.system(size: 25))
                    )
                Rectangle()
                    .shadow(color: .gray, radius: 5, x: 10, y: 5)
                    .frame(width: 308, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .cornerRadius(20, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .overlay(
                        VStack {
                            Text("0")
                            Text("interviews postponed")
                        }
                        .foregroundColor(.orange)
                        .font(.system(size: 25))
                    )
            }
            .offset(x: 0, y:-250)
            
            HStack {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                Text("Create New")
                    .foregroundColor(.blue)
                    .bold()
            }
            .offset(x: -400, y: -100)
            .onTapGesture {
                isPreparationViewactive = true
                            }
            .navigationDestination(isPresented: $isPreparationViewactive) {
                    PreparationView()
                                        }
            .toolbar(.hidden)
        }
        
        
        
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
