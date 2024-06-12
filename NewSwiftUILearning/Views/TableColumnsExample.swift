//
//  TableColumnsExample.swift
//  NewSwiftUILearning
//
//  Created by John Endres on 6/11/24.
//

import SwiftUI

struct SongCountsTable: View {
    var body: some View {
        Table(Self.guestData) {
            // A static column for the name
            TableColumn("Name", value: \.name)
            
            TableColumnForEach(Self.partyData) { party in
                TableColumn(party.name) { guest in
                    Text(guest.songsSung[party.id] ?? 0, format: .number)
                }
            }
        }
    }
    
    private static func randSongsSung(low: Bool = false) -> [Int : Int] {
        var songs: [Int : Int] = [:]
        for party in partyData {
            songs[party.id] = low ? Int.random(in: 0...3) : Int.random(in: 3...12)
        }
        return songs
    }
    
    private static let guestData: [GuestData] = [
        GuestData(name: "Sommer", songsSung: randSongsSung()),
        GuestData(name: "Sam", songsSung: randSongsSung()),
        GuestData(name: "Max", songsSung: randSongsSung()),
        GuestData(name: "Kyle", songsSung: randSongsSung(low: true)),
        GuestData(name: "Matt", songsSung: randSongsSung(low: true)),
        GuestData(name: "Apollo", songsSung: randSongsSung()),
        GuestData(name: "Anna", songsSung: randSongsSung()),
        GuestData(name: "Raj", songsSung: randSongsSung()),
        GuestData(name: "John", songsSung: randSongsSung(low: true)),
        GuestData(name: "Harry", songsSung: randSongsSung()),
        GuestData(name: "Luca", songsSung: randSongsSung()),
        GuestData(name: "Curt", songsSung: randSongsSung()),
        GuestData(name: "Betsy", songsSung: randSongsSung())
    ]
    
    private static let partyData: [PartyData] = [
        PartyData(partyNumber: 1, numberGuests: 5),
        PartyData(partyNumber: 2, numberGuests: 6),
        PartyData(partyNumber: 3, numberGuests: 7),
        PartyData(partyNumber: 4, numberGuests: 9),
        PartyData(partyNumber: 5, numberGuests: 9),
        PartyData(partyNumber: 6, numberGuests: 10),
        PartyData(partyNumber: 7, numberGuests: 11),
        PartyData(partyNumber: 8, numberGuests: 12),
        PartyData(partyNumber: 9, numberGuests: 11),
        PartyData(partyNumber: 10, numberGuests: 13),
    ]
    
}

struct GuestData: Identifiable {
    let name: String
    let songsSung: [Int : Int]
    
    let id = UUID()
}

struct PartyData: Identifiable {
    let partyNumber: Int
    let numberGuests: Int
    let symbolSize = 100
    
    var id: Int {
        partyNumber
    }
    
    var name: String {
        "\(partyNumber)"
    }
}

#Preview {
    SongCountsTable()
        .padding(40)
}
