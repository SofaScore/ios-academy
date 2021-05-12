//
//  EventRowView.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 12/05/2021.
//

import SwiftUI

struct EventRowView: View {

    private let event: Event
    private let storageService: StorageService

    @State private var eventStarred: Bool = false

    var body: some View {
        HStack {
            Button(action: {
                if eventStarred {
                    storageService.deleteEvent(eventId: event.id)
                    eventStarred = false
                } else {
                    storageService.saveEvent(event: event)
                    eventStarred = true
                }
            }, label: {
                if eventStarred {
                    Image("unstar")
                        .resizable()
                        .frame(width: 24, height: 24)
                } else {
                    Image("star")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            })
            VStack(alignment:.leading) {
                Text(event.homeTeamName)
                Text(event.awayTeamName)
            }
            Spacer()
            Text(formatTimestamp(timestamp: event.startTimestamp))
                .font(.subheadline)
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .leading)
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.15), radius: 4, x: 0, y: 2)
    }

    init(event: Event, storageService: StorageService = CoreDataStorageService()) {
        self.storageService = storageService
        self.event = event
        _eventStarred = State(initialValue: storageService.isEventSaved(eventId: event.id))
    }

    private func formatTimestamp(timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
}
