//
//  LiveClass.swift
//  Crehana Live
//
//  Created by Nicolás A. Rodríguez on 6/29/20.
//

import Foundation

// MARK: - Welcome
struct LiveClass: Codable {
    let data: DataClass

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let nextLives: CurrentLive

    enum CodingKeys: String, CodingKey {
        case nextLives = "nextLives"
    }
}

struct CurrentLive: Codable {
    let edges: [Edge]

    enum CodingKeys: String, CodingKey {
        case edges = "edges"
    }
}

struct Edge: Codable, Hashable {
    let node: Node
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(node)
    }
    enum CodingKeys: String, CodingKey {
        case node = "node"
    }
}

// MARK: - Node
struct Node: Codable, Hashable {
    let originalID: Int
    let title: String?
    let startLive: Date?
    let dueLive: Date?
    let videoProvider: String?
    let bannerMobileImageURL: String?
    let liveDetailURL: String?

    enum CodingKeys: String, CodingKey {
        case originalID = "originalId"
        case title = "title"
        case startLive = "startLive"
        case dueLive = "dueLive"
        case videoProvider = "videoProvider"
        case bannerMobileImageURL = "bannerMobileImageUrl"
        case liveDetailURL = "liveDetailUrl"    }
}
