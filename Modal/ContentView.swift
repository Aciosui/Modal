//
//  ContentView.swift
//  Modal
//
//  Created by MD  on 3/23/24.
//

import SwiftUI

struct ContentView: View {
      @State var showModal: Bool = false
    @AccessibilityFocusState private var isTitleFocused: Bool
    @AccessibilityFocusState private var isTriggerButtonFocused: Bool
    var body: some View {
  ScrollView {
            VStack {
                Text("Page Title")
                    .font(.headline)
                    .fontWeight(.bold)
                    .accessibilityAddTraits(.isHeader)
                Button(action: {
                    showModal.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.02){
                        isTitleFocused = true}
                }){
                    Text("Show Modal")
                        .accessibilityFocused($isTriggerButtonFocused)
                }
                .padding(50)
                
                if(showModal){
                    VStack{
                        
                        Text("Modal dialog Title")
                            .foregroundColor(.green)
                            .font(.title)
                            .padding(.top)
                            .accessibilityAddTraits(.isHeader)
                            .accessibilityFocused($isTitleFocused)
                        Text("Focus Management is a crucial part of accessibility in dialog for screen reader and keyboard only user.")
                            .padding(25)
                            .foregroundColor(.green)
                        Button("Close", action: {
                            showModal.toggle()
                            isTriggerButtonFocused = true
                        }).padding(.bottom)
                    }
                        .accessibilityAddTraits(.isModal)
                        .accessibilityAction(.escape) {
                            showModal.toggle()
                            isTriggerButtonFocused = true
                            
                        }
                        .padding()
                        .background(Color.white)
                        .shadow(radius: 10)

                }
                
               
            }
    
        }
    }
}

#Preview {
    ContentView()
}
