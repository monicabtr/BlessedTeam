//
//  ContentView.swift
//  BlessedTeam
//
//  Created by Monica Butarbutar on 26/05/23.
//

import SwiftUI

struct OnboardingView: View {
    @State var isHomeViewactive: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 250, height: 250)
                    HStack {
                        Text("Interview").foregroundColor(.blue).font(.title) + Text("Assist").italic().bold().foregroundColor(.blue).font(.title)
                    }
                }
                .onTapGesture {
                    isHomeViewactive = true
                                }
                .navigationDestination(isPresented: $isHomeViewactive) {
                        HomeView()
                                        }
                .toolbar(.hidden)
            }
            .background(Color("abu"))
        }
        
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
