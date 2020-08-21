//
//  Emoji.swift
//  collectionViews_oldSchool
//
//  Created by Jonathan Phouminh on 7/14/20.
//  Copyright © 2020 Jonathan Phouminh. All rights reserved.
//

import Foundation

class Emoji {
  enum Category: String, CaseIterable{
    case smileysAndPeople = "Smileys & People"
    case animalsAndNature = "Animals & Nature"
    case foodAndDrink = "Food & Drink"
    case activity = "Activity"
    case travelAndPlaces = "Travel & Places"
    case objects = "Objects"
    case symbols = "Symbols"
    case flags = "Flags"
  }
  
  static let shared = Emoji()      // singleton object
  
    let sections: [Category] = Category.allCases   // this returns the amount of different cases in the Emoji enum, provided by CaseIterable protocol
  
    // this is a dictionary not an array, Type -> Array[String]
  var data: [Category: [String]] = [
    .smileysAndPeople: ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "☺️", "😊", "😊", "😇", "🙂", "😎", "🤩", "😴", "😬", "🥵"],
    .animalsAndNature: ["🐶", "🐱", "🦊", "🐻", "🦁", "🐮", "🐸", "🐵", "🐔", "🐧", "🦉", "🐴", "🦋", "🐙", "🐬", "🐈", "🌲", "🌍"],
    .foodAndDrink:     ["🍏", "🍇", "🍓", "🥝", "🍅", "🌽", "🥕", "🥨", "🧀", "🍖", "🦴", "🌮", "🍣", "🥤", "🥃", "🥟", "🍺", "🍪"],
    .activity:         ["⚽️", "🏉", "🥏", "🏏", "🥅", "🛹", "🛷", "🏋️‍♂️", "🏅", "🎪", "🎬", "🎼", "🎲", "🎳", "🎮", "🎸", "🧩", "🏆"],
    .travelAndPlaces:  ["🚗", "🚑", "🚨", "🚠", "🚟", "🚄", "✈️", "🚤", "🚧", "🏠", "⛱", "🌋", "⛩", "🕋", "⛪️", "🌠", "🌇", "🗽"],
    .objects:          ["⌚️", "🖱", "🖲", "💾", "☎️", "📺", "💴", "🔨", "🧰", "🧲", "🎁", "🎊", "✉️", "🗳", "📌", "🔍", "🔐", "💰"],
    .symbols:          ["❤️", "💔", "☮️", "☯️", "☢️", "🆚", "🉐", "🆘", "❌", "💯", "‼️", "🚸", "⚜️", "♿️", "🔈", "🔔", "♣️", "🚸"],
    .flags:            ["🏳️", "🇺🇸", "🇯🇵", "🇩🇪", "🇨🇦", "🇲🇽", "🇧🇷", "🇰🇪", "🇳🇬", "🇮🇳", "🇷🇺", "🇦🇺", "🇫🇷", "🇵🇱", "🇻🇳", "🇱🇹", "🇱🇰", "🇪🇪"]
  ]
  
  private init() {}
  
  static func randomEmoji() -> (Category, String) {
    let extraEmoji = ["💀", "🤖", "👍", "🤘🏾", "🖐🏼", "👇🏽", "🙏🏾", "👀", "👩🏽‍🦱", "👩🏿", "🧕🏽", "🕵🏻‍♂️", "👨🏼‍💻", "👭", "🧚🏾‍♂️", "💍"]
    let randomIndex = Int.random(in: 0..<extraEmoji.count)
    return (.smileysAndPeople, extraEmoji[randomIndex])
  }
    
    

    // returns an emoji
    func emoji(at indexPath: IndexPath) -> String? {
        let wantedCategory = sections[indexPath.section]
        let categoryArray = data[wantedCategory]  // this returns as an optional
        let wantedEmoji = categoryArray?[indexPath.row]
        return wantedEmoji
    }
    
    // function that finds the Category of an emoji that was passed
    func findCategory(_ emoji: String) -> Emoji.Category?{
        let sectionArrays: [Emoji.Category] = [.symbols, .activity, .flags,.travelAndPlaces,.objects, .foodAndDrink, .animalsAndNature, .smileysAndPeople]
        
        for section in sectionArrays {
            for item in data[section]!{
                if item == emoji{
                    return section 
                }
            }
        }
      
        
        
        return nil
    }
}
