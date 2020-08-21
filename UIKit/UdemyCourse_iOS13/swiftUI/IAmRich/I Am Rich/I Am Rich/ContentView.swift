//
//  ContentView.swift
//  I Am Rich
//
//  Created by Jonathan Phouminh on 6/22/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import SwiftUI


// this is what the user sees
struct ContentView: View {
    var body: some View {
        ZStack{
        Color(.systemTeal).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("I Am Rich!")
                .font(.system(size:40))
                .fontWeight(.bold)
                    .foregroundColor(Color.white)
                Image("diamond") // by default, it searches for the images name.
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
        }
    }
}

// this is the settings of how SwiftUI loads up the render
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone X"))
    }
}
