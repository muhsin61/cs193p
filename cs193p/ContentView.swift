//
//  ContentView.swift
//  cs193p
//
//  Created by Muhsin Köse on 7.06.2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = [ "🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚋", "🚞", "🚝", "🚄", "🚅", "🚈", "🚂", "🚆", "🚇", "🚊", "🚉", "🚁"]
    
    @State var emojiCount: Int = 4;

    var body: some View {
        VStack{
            Text("Memorize!")
                .padding()
                .font(.largeTitle)
            ScrollView{
                HStack{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                        ForEach(emojis[0..<emojiCount],id: \.self){emoji in
                            CardView(content: emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
            HStack{
                AddButton
                Spacer()
                RemoveButton
            }.padding(.horizontal)
        }
    }
    var AddButton: some View{
        Button(action: {
            if(emojiCount>1){
                emojiCount-=1
            }
        },label:{
            Image(systemName: "minus.circle")
        })
        .disabled(emojiCount==1)
        .font(.largeTitle)
    }
    var RemoveButton: some View{
        Button(action: {
            if(emojiCount<emojis.count){
                emojiCount+=1
            }
        },label:{
            Image(systemName: "plus.circle")
        })
        .disabled(emojiCount==emojis.count)
        .font(.largeTitle)
    }
}

struct CardView: View{
    
    @State var isFaceUp: Bool = true;
    var content: String;
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if(isFaceUp){
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp;
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
