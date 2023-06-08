//
//  PreparationView.swift
//  BlessedTeam
//
//  Created by Monica Butarbutar on 26/05/23.
//

import SwiftUI

struct PreparationView: View {
    @State var isPreparationFinishViewactive: Bool = false
    @State private var inputResearchTitle: String = ""
    @State private var inputResearchObjective: String = ""
    @State private var inputDate: String = ""
    @State private var inputQuestions: [String] = [""]
    @State private var shouldAddTextField = false
    
    var body: some View {
        ZStack {
            
            Form{
                HStack{
                    Text("Research Title").frame(width: 150, alignment: .leading)
                    TextField("Write Your Research Title Here", text: $inputResearchTitle)
                }.padding()
                HStack{
                    Text("Research Objective").frame(width: 150, alignment: .leading)
                    TextField("Write Your Research Objective Here", text: $inputResearchObjective)
                }.padding()
                HStack {
                    HStack{
                        Text("Start").frame(width: 80, alignment: .leading)
                        TextField("dd/mm/yy", text: $inputDate)
                    }
                    HStack{
                        Text("Deadline").frame(width: 80, alignment: .leading)
                        TextField("dd/mm/yy", text: $inputDate)
                    }
                }.padding()
                
                VStack {
                    ForEach(0..<inputQuestions.count, id: \.self) { index in
                        HStack {
                            Text("Question").frame(width: 150, alignment: .leading)
                            TextField("Write Your Question Here", text: self.$inputQuestions[index])
                                .padding()
                                                                }
                        }
                }
                Image("background")
            }
//            .scrollContentBackground(.hidden)
            .navigationTitle("User Interview Details")
            .navigationBarItems(trailing: Button(action: {
                saveData()
                }) {
                Text("Done")
                .onTapGesture {
                    isPreparationFinishViewactive = true
                                }
                .navigationDestination(isPresented: $isPreparationFinishViewactive) {
                    PreparationFinishView()
                                }
                })
            
        }
        
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        Button(action: {
            addInputQuestions()
        }) {
            Image(systemName: "plus.circle.fill")
                .foregroundColor(.green)
            Text("add new question")
                .foregroundColor(.black)
        }
//        .padding(.bottom)
        .onTapGesture {
                    shouldAddTextField = true
                }
        .onChange(of: shouldAddTextField) { shouldAdd in
            if shouldAdd {
                addInputQuestions()
                shouldAddTextField = false
            }
        }
      
    }
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func saveData() {
        isPreparationFinishViewactive = true
    }
    
    func addInputQuestions() {
        inputQuestions.append("")
    }
    
}

struct PreparationView_Previews: PreviewProvider {
    static var previews: some View {
        PreparationView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
