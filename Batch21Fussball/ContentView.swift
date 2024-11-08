//
//  ContentView.swift
//  Batch21Fussball
//
//  Created by Till Hemmerich on 08.11.24.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    @Environment(\.modelContext)
    private var context
    
    @Query var manschaften : [Manschaft]
    @Query var spieler : [Spieler]
    @State var manschaftsName : String = ""
    
    var body: some View {
        VStack {
            Text("Anzahl Manschaften: \(manschaften.count)")
            Text("Anzahl Spieler :\(spieler.count)")
            List{
                Section("Manschaften:"){
                    ForEach(manschaften){ manschaft in
                        Section(manschaft.name){
                            ForEach(manschaft.spieler){ spieler in
                                Text("Name: \(spieler.name) Nummer : \(spieler.nummer)")
                            }
                        }
                    }
                }
                Section("Spieler"){
                    ForEach(spieler){spieler in
                        Text("\(spieler.name)")
                    }
                }
            }
            
            HStack{
                TextField("Name:",text: $manschaftsName)
                Button("ADD"){
                    creatManschaft(name: manschaftsName)
                }
            }
            Button("Delete First"){
                context.delete(manschaften[0])
            }
        }
        .padding()
    }
    private func creatManschaft(name : String){
        var neueManschaft = Manschaft(name: name, Stadion: "Tills Garten", spieler: [])
        var player1 = Spieler(name: "Nico", nummer: 13, manschaft: neueManschaft)
        var player2 = Spieler(name: "Till", nummer: 76, manschaft: neueManschaft)
        var player3 = Spieler(name: "Robin", nummer: 33, manschaft: neueManschaft)
        
        context.insert(neueManschaft)
        context.insert(player1)
        context.insert(player2)
        context.insert(player3)
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for:[Manschaft.self,Spieler.self])
}
