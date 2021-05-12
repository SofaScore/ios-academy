//
//  StorageService.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 12/05/2021.
//

import Foundation

protocol StorageService {

    func getSavedEvents() -> [Event]
    func saveEvent(event: Event)
    func deleteEvent(eventId: Int)
    func isEventSaved(eventId: Int) -> Bool
}
