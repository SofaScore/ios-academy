//
//  UserDefaultsStorageService.swift
//  SofaScoreAcademy
//
//  Created by Kristian Vukušić on 12/05/2021.
//

import Foundation

class UserDefaultsStorageService: StorageService {

    private static let savedEventIdsKey = "savedEventIdsKey"
    private static let savedEventPrefixKey = "event."

    func getSavedEvents() -> [Event] {
        let decoder = JSONDecoder()
        var res = [Event]()
        for eventId in getSavedEventIds() {
            guard let data = UserDefaults().object(forKey: "\(Self.savedEventPrefixKey)\(eventId)") as? Data else { continue }
            guard let event = try? decoder.decode(Event.self, from: data) else { continue }
            res.append(event)
        }
        return res
    }

    func deleteEvent(eventId: Int) {
        UserDefaults().removeObject(forKey: "\(Self.savedEventPrefixKey)\(eventId)")
        var eventIds = getSavedEventIds()
        eventIds = eventIds.filter { $0 == eventId }
        saveEventIds(arr: eventIds)
    }

    func saveEvent(event: Event) {
        guard let data = try? JSONEncoder().encode(event) else { return }
        UserDefaults().set(data, forKey: "\(Self.savedEventPrefixKey)\(event.id)")
        var eventIds = getSavedEventIds()
        eventIds.append(event.id)
        saveEventIds(arr: eventIds)
    }

    func isEventSaved(eventId: Int) -> Bool {
        return UserDefaults().value(forKey: "\(Self.savedEventPrefixKey)\(eventId)") != nil
    }

    private func getSavedEventIds() -> [Int] {
        return UserDefaults().array(forKey: Self.savedEventPrefixKey) as? [Int] ?? [Int]()
    }

    private func saveEventIds(arr: [Int]) {
        UserDefaults().set(arr, forKey: Self.savedEventPrefixKey)
    }
}
