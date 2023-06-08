//
//  ParticipantView.swift
//  BlessedTeam
//
//  Created by Monica Butarbutar on 29/05/23.
//

import SwiftUI

struct ParticipantView: View {
    @State var isMainViewactive: Bool = false
    @State private var isShowingAddParticipantAlert = false
    @State private var participantName = ""
    @State private var shouldAddParticipant = false
    
    var body: some View {
        ZStack {
            Image("background")
            Text("Start: 01 June 2023 - Deadline: 06 June 2023")
                .offset(x:0, y:-300)
            HStack(spacing:180) {
                Text("Participants Name")
                    .font(.system(size: 22, weight: .bold))
                Text("Date")
                    .font(.system(size: 22, weight: .bold))
                Text("Time")
                    .font(.system(size: 22, weight: .bold))
                Text("Status")
                    .font(.system(size: 22, weight: .bold))
            }
            .frame(maxWidth: .infinity)
            .offset(x:0, y:-200)
            
            HStack {
                Button(action: {
                    isShowingAddParticipantAlert = true
                }) {
                    Text("Add Participant")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .alert(isPresented: $isShowingAddParticipantAlert) {
                Alert(
                    title: Text("Add Participant"),
                    message: Text("Write Participants Full Name"),
                    primaryButton: .cancel(),
                    secondaryButton: .default(
                        Text("Done"),
                        action: {
                            // Tindakan yang dijalankan saat tombol "Done" ditekan
                            // Misalnya, Anda dapat menyimpan nama peserta ke dalam koleksi
                            print("Participant name:", participantName)
                        }
                    )
                    
                )
            }
            .navigationTitle("Understanding User Preferences and Expectations towards the Application")
            .navigationBarItems(trailing: Button(action: {
                editData()
            }) {
                Text("Edit")
                    .onTapGesture {
                        isMainViewactive = true
                    }
                    .navigationDestination(isPresented: $isMainViewactive) {
                        MainView()
                    }
            })
            
            
        }
    }
        
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        func editData() {
            isMainViewactive = true
        }
        
        //    func addInputParticipants() {
        //        inputParticipants.append("")
        //    }
        
    
}

//struct ParticipantView_Previews: PreviewProvider {
//    static var previews: some View {
//        ParticipantView()
//    }
//}
