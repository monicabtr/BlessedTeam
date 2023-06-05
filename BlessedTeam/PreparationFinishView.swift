//
//  PreparationFinishView.swift
//  BlessedTeam
//
//  Created by Monica Butarbutar on 29/05/23.
//

import SwiftUI

struct PreparationFinishView: View {
    @State var isParticipantViewactive: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: "plus.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            Text("Create New")
                .foregroundColor(.blue)
                .bold()
        }
        .toolbar(.hidden)
        .position(x:100, y:50)
        
        HStack {
            Text("Understanding User Preferences and Expectations towards the Application.")
            Image(systemName: "pencil")
        }
        .position(x:350, y:-250)
        .onTapGesture {
            isParticipantViewactive = true
                        }
        .navigationDestination(isPresented: $isParticipantViewactive) {
            ParticipantView()
                        }
    }
}

//struct PreparationFinishView_Previews: PreviewProvider {
//    static var previews: some View {
//        PreparationFinishView()
//    }
//}
