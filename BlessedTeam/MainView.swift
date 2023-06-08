//
//  MainView.swift
//  BlessedTeam
//
//  Created by Monica Butarbutar on 29/05/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Text("Eren Monica")
                    .font(.largeTitle)
                    .position(x: geometry.size.width/2 - 400, y: geometry.size.height/2 - 350)

                HStack {
                    Text("Tap to time stamp")
                    Text("0/6")
                }
                .bold()
                .position(x: geometry.size.width/2 - 400, y: geometry.size.height/2 - 200)
                
                List {
                    Text("Can you describe any pain points or frustrations you experience while using the app?")
                    Text("How frequently do you use this app, and in what contexts or situations?")
                    Text("Are there any specific improvements or changes you would like to see in the app?")
                    Text("Have you encountered any difficulties in understanding the app's navigation or menu structure?")
                    Text("How do you feel about the visual design and aesthetics of the app?")
                    Text("How do you feel about the visual design and aesthetics of the app?")
                }
                .scrollContentBackground(.hidden)
                .frame(width: geometry.size.width * 0.5, height: 400)
                .position(x: geometry.size.width/2 - 200, y: geometry.size.height/2 + 100)

                
                
    //            VStack {
    //                Text("Waveform View")
    //                    .font(.title)
    ////                WaveformView(audioURL: /* URL rekaman suara */)
    //                    .frame(height: 200)
    //            }
                
                Text("Timestamp")
                //nanti ada list timestamp
                    .bold()
                    .position(x: geometry.size.width/2 + 250, y: geometry.size.height/2 - 150)
                
                Text("Stamp Button")
                    .bold()
                    .position(x: geometry.size.width/2 + 250, y: geometry.size.height/2 - 50)
                
                HStack {
                    Button(action: {
                        // Tindakan yang akan dilakukan saat tombol ditekan
                        print("Tombol ditekan")
                    }) {
                        HStack {
                            Image("probing")
                                .resizable()
                                .frame(width: 32, height: 20)
                            Text("PROBING")
                                .foregroundColor(.black)
                                .padding()
                                .font(.system(size:12))
                        }
                        .frame(width: 145, height: 30)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        )
                    }
                    
                    Button(action: {
                        // Tindakan yang akan dilakukan saat tombol ditekan
                        print("Tombol ditekan")
                    }) {
                        HStack {
                            Image("insight")
                                .resizable()
                                .frame(width: 32, height: 20)
                            Text("INSIGHT")
                                .foregroundColor(.black)
                                .padding()
                                .font(.system(size:12))
                        }
                        .frame(width: 145, height: 30)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        )
                    }
                }
                .position(x: geometry.size.width/2 + 350, y: geometry.size.height/2)
                
                HStack {
                    Button(action: {
                        // Tindakan yang akan dilakukan saat tombol ditekan
                        print("Tombol ditekan")
                    }) {
                        HStack {
                            Image("need")
                                .resizable()
                                .frame(width: 32, height: 20)
                            Text("NEED")
                                .foregroundColor(.black)
                                .padding()
                                .font(.system(size:12))
                        }
                        .frame(width: 145, height: 30)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        )
                    }
                    
                    Button(action: {
                        // Tindakan yang akan dilakukan saat tombol ditekan
                        print("Tombol ditekan")
                    }) {
                        HStack {
                            Image("hope")
                                .resizable()
                                .frame(width: 32, height: 20)
                            Text("HOPE")
                                .foregroundColor(.black)
                                .padding()
                                .font(.system(size:12))
                        }
                        .frame(width: 145, height: 30)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        )
                    }
                }
                .position(x: geometry.size.width/2 + 350, y: geometry.size.height/2 + 50)
                
                HStack {
                    Button(action: {
                        // Tindakan yang akan dilakukan saat tombol ditekan
                        print("Tombol ditekan")
                    }) {
                        HStack {
                            Image("motivation")
                                .resizable()
                                .frame(width: 32, height: 20)
                            Text("MOTIVATION")
                                .foregroundColor(.black)
                                .padding()
                                .font(.system(size:12))
                        }
                        .frame(width: 145, height: 30)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        )
                    }
                    
                    Button(action: {
                        // Tindakan yang akan dilakukan saat tombol ditekan
                        print("Tombol ditekan")
                    }) {
                        HStack {
                            Image("disappointed")
                                .resizable()
                                .frame(width: 32, height: 20)
                            Text("DISAPPOINTED")
                                .foregroundColor(.black)
                                .padding()
                                .font(.system(size:12))
                        }
                        .frame(width: 145, height: 30)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        )
                    }
                }
                .position(x: geometry.size.width/2 + 350, y: geometry.size.height/2 + 100)
                
                HStack {
                    Button(action: {
                        // Tindakan yang akan dilakukan saat tombol ditekan
                        print("Tombol ditekan")
                    }) {
                        HStack {
                            Image("happy")
                                .resizable()
                                .frame(width: 32, height: 20)
                            Text("HAPPY")
                                .foregroundColor(.black)
                                .padding()
                                .font(.system(size:12))
                        }
                        .frame(width: 145, height: 30)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        )
                    }
                    
                    Button(action: {
                        // Tindakan yang akan dilakukan saat tombol ditekan
                        print("Tombol ditekan")
                    }) {
                        HStack {
                            Image("satisfied")
                                .resizable()
                                .frame(width: 32, height: 20)
                            Text("SATISFIED")
                                .foregroundColor(.black)
                                .padding()
                                .font(.system(size:12))
                        }
                        .frame(width: 145, height: 30)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        )
                    }
                    
                }
                .position(x: geometry.size.width/2 + 350, y: geometry.size.height/2 + 150)
                
                HStack {
                    Button(action: {
                        // Tindakan yang akan dilakukan saat tombol ditekan
                        print("Tombol ditekan")
                    }) {
                        HStack {
                            Image("confused")
                                .resizable()
                                .frame(width: 32, height: 20)
                            Text("CONFUSED")
                                .foregroundColor(.black)
                                .padding()
                                .font(.system(size:12))
                        }
                        .frame(width: 145, height: 30)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        )
                    }
                    
                    Button(action: {
                        // Tindakan yang akan dilakukan saat tombol ditekan
                        print("Tombol ditekan")
                    }) {
                        HStack {
                            Image("frustration")
                                .resizable()
                                .frame(width: 32, height: 20)
                            Text("FRUSTRATION")
                                .foregroundColor(.black)
                                .padding()
                                .font(.system(size:12))
                        }
                        .frame(width: 145, height: 30)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                        )
                    }
                }
                .position(x: geometry.size.width/2 + 350, y: geometry.size.height/2 + 200)
                
                
                
                
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

