//
//  EventListView.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 12/05/2021.
//

import SwiftUI

struct EventListView: View {

    private let events: [Event]

    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 20, alignment: .center),
              count: 1)
    }

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(events, id: \.id) { event in
                EventRowView(event: event)
            }
        }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    }

    init(events: [Event]) {
        self.events = events
    }
}
