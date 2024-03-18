//
//  ContentView.swift
//  EmojiCounter
//
//  Created by Josh Guiang on 3/18/24.
//

import SwiftUI


class EmojiCounterViewModel: ObservableObject {

    @Published var count: Int
    

    init(initialCount: Int) {
        self.count = initialCount
    }
    

    

    func increase() {
        count += 1
    }
    

    func decrease() {
        count -= 1
    }
}


struct ContentView: View {
    

     @StateObject var tilt_Laugh_Cry_Emoji = EmojiCounterViewModel(initialCount: 3)

     @StateObject var wink_Eye_Emoji = EmojiCounterViewModel(initialCount: -2)

     @StateObject var straight_Smile_Emoji = EmojiCounterViewModel(initialCount: 2)
 
     @StateObject var star_Eyed_Emoji = EmojiCounterViewModel(initialCount: 1)
  
     @StateObject var straight_Laugh_Cry_Emoji = EmojiCounterViewModel(initialCount: -1)
     

    var body: some View {
        
   
      NavigationView {
        
  
      VStack(spacing: 6) {
            
            
                
        
                emojiRow(emoji: "🤣", viewModel: tilt_Laugh_Cry_Emoji)
             
                emojiRow(emoji: "😜", viewModel: wink_Eye_Emoji)
                
                emojiRow(emoji: "😄", viewModel: straight_Smile_Emoji)
               
                emojiRow(emoji: "🤩", viewModel: star_Eyed_Emoji)
                
                emojiRow(emoji: "😂", viewModel: straight_Laugh_Cry_Emoji)
                 
                
                Spacer()
            }
            
            
            .background(Color(.white))
          
          
            .toolbarBackground(
                           Color.white,
                           for: .navigationBar)
                       .toolbarBackground(.visible, for: .navigationBar)
       
            
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Emoji Counter")
                        .font(.title.bold())
                        .foregroundColor(.red)
                }
            }
        }
    }
    

func emojiRow(emoji: String, viewModel: EmojiCounterViewModel) -> some View {
        
        
        HStack {
            
          
            Text(emoji)
                .font(.system(size: 40))
            
          
            Spacer()
            
                    Text("Counter: \(viewModel.count)")
                .font(.title2)
                .foregroundColor(.red)
            
            Spacer()
            
           
            Button(action: {
                viewModel.increase()
            }) {
                
                Text("+")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.red)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.red, lineWidth: 1.25))
            }
            
           
            Button(action: {
                viewModel.decrease()
            }) {
                
                Text("-")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(Color.red)
                    .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.red, lineWidth: 1.25))
            }
        }
    
 
        .border(Color.gray, width: 0.25)
        
 
        .padding(.horizontal)
        
        
        .frame(height: 55)
        
     
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 

