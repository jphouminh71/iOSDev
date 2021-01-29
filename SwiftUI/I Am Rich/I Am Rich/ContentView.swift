//
//  ContentView.swift
//  I Am Rich
//
//  Created by Jonathan Phouminh on 1/26/21.
//  Copyright © 2021 Jonathan Phouminh. All rights reserved.
//

import SwiftUI

/* This is the code that we see when our app is rendering */
struct ContentView: View {
    var body: some View {
        
        ZStack{ // Z stack layers the elements
            Color(.systemTeal)
            .edgesIgnoringSafeArea(.all)
            VStack() {
                Text("I Am Rich")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Image("diamond").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 200.0, height: 200.0, alignment: .center)
                
            }
        }
    }
}


/* This is the code that handles the simulator that we see on the right*/
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
