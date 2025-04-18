//
//  ContentView.swift
//  LincolnWord
//
//  Created by Andy Topley on 03/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var word = ""
    @FocusState private var isTextFieldFocused: Bool
    @State private var textCaseSwitch = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text(word)
                .font(.system(size: 300, weight: .heavy, design: .rounded))
                .animation(.easeInOut (duration: 0.15))
                .minimumScaleFactor(0.1)
                .textCase(textCaseSwitch == 1 ? .lowercase : .uppercase)
                
                .scaledToFit()
            
            
            
            Spacer()
            
            HStack {
                Spacer()
                TextField("Enter a word", text: $word)
                    .padding(5.0)
                    .frame(width: 200)
                    .multilineTextAlignment(.center)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .autocorrectionDisabled()
                    .textFieldStyle(.automatic)
                    .focused($isTextFieldFocused) // Bind to the focus state
                    .overlay(
                                        Group {
                                            if !word.isEmpty {
                                                Button(action: {
                                                    word = ""
                                                    isTextFieldFocused = true // Set focus when the button is pressed
                                                        
                                                }, label: {
                                                    Image(systemName: "xmark.circle.fill")
                                                        .foregroundColor(.gray)
                                                        .opacity(0.3) // Make it slightly transparent
                                                })
                                                .padding(.trailing, 8) // Add padding to the button itself
                                                
                                            }
                                        }
                                        , alignment: .trailing
                                    )
                                .animation(.default, value: word) // Animate the button's appearance
                
                Button("Capitalise") {
                    if textCaseSwitch == 0 {
                        textCaseSwitch = 1
                    } else {
                        textCaseSwitch = 0
                    }
                    print(textCaseSwitch)
                }
                Spacer()
            }
            
            
            
            
            
        }
        .padding()
        .foregroundStyle(.accent)
        .background(Color.background)
        .onTapGesture {
            isTextFieldFocused = false
        }
        .onAppear(){
            isTextFieldFocused = true
        }
    }
}

#Preview {
    ContentView()
}
