//
//  WidgetRepository.swift
//  Crehana Live
//
//  Created by Nicolás A. Rodríguez on 6/29/20.
//

import Foundation
import Combine

protocol LiveClassRepositoryProtocol {
    func getAll(completion: @escaping (LiveClass?, Error?) -> Void)
}

struct LiveClassRepository: LiveClassRepositoryProtocol {
    func getAll(completion: @escaping (LiveClass?, Error?) -> Void) {
        let decoder = JSONDecoder.init()
        decoder.dateDecodingStrategy = .iso8601
        
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let jsonData = try decoder.decode(LiveClass.self, from: data)
                print("ok")
                completion(jsonData, nil)
            } catch(let error) {
                print("error \(error.localizedDescription)")
                completion(nil, error)
            }
        } else {
            print("File not found")
        }
    }
}
