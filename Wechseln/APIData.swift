//
//  APIData.swift
//  Wechseln
//
//  Created by Дмитрий Егоров on 08.11.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

enum Rover: String, CaseIterable {
    case curiosity, opportunity, spirit
}

enum RoverCamera: String, Codable {
    case chemcam, fhaz, mardi, mahli, rhaz, mast, navcam, pancam, minites, entry
    
    init(from decoder: Decoder) throws {
        let rawValue = try decoder.singleValueContainer().decode(String.self).lowercased()
        
        if let data = RoverCamera(rawValue: rawValue) {
            self = data
        }
        else {
            throw NSError(domain: "", code: 1, userInfo: [:])
        }
    }
}

struct ManifestResponse: Decodable {
    let photoManifest: Manifest
}

struct Manifest: Decodable {
    let landingDate: Date
    let launchDate: Date
    let maxSol: Int
    let totalPhotos: Int
    let photos: [Photo]
}

extension Manifest {
    struct Photo: Decodable {
        let sol: Int
        let totalPhotos: Int
        let cameras: [RoverCamera]
    }
}
