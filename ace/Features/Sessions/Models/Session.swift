//
//  Session.swift
//  ace
//
//  Created by Bartek on 07/11/2025.
//

import Foundation

struct Session: Identifiable, Codable, Equatable {
    let id: String
    let userId: String
    let date: Date
    let duration: Int?  //value in minutes
    let location: String?  //sport facility
    let details: Details

    enum Details: Equatable {
        case training(TrainingDetails)
        case match(MatchDetails)
    }

}

struct TrainingDetails: Codable, Equatable {
    let focusAreas: [String]
    let intensity: Int?
    let notes: String?

}

struct MatchDetails: Codable, Equatable {
    let opponentUserId: String
    let setScores: [String]
    let official: Bool
    let notes: String?
}


extension Session.Details: Codable {
    private enum CodingKeys: String, CodingKey {
        case type
        case training
        case match
    }

    private enum DetailType: String, Codable {
        case training
        case match
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(DetailType.self, forKey: .type)

        switch type {
        case .training:
            let details = try container.decode(TrainingDetails.self, forKey: .training)
            self = .training(details)
        case .match:
            let details = try container.decode(MatchDetails.self, forKey: .match)
            self = .match(details)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .training(let details):
            try container.encode(DetailType.training, forKey: .type)
            try container.encode(details, forKey: .training)
        case .match(let details):
            try container.encode(DetailType.match, forKey: .type)
            try container.encode(details, forKey: .match)
        }
    }
}

