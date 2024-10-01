//
//  CustomDataSet.swift
//  UserDefaults
//
//  Created by Oleksii on 30.09.2024.
//

import Foundation

struct User: Codable {
    let login: String
    let lastActivityDate: Date
}

// save user to UserDefaults
func save(user: User) {
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(user)
        UserDefaults.standard.set(data, forKey: "user")
    } catch {
        // handle error
    }
}
// get user from UserDefaults
func getUser() -> User? {
    guard let data = UserDefaults.standard.data(forKey: "user") else {
        return nil
    }
    let decoder = JSONDecoder()
    let user = try? decoder.decode(User.self, from: data)
    return user
}
