//
//  Image.swift
//  Platzi Agenda
//
//  Created by Nicolás A. Rodríguez on 12/3/19.
//  Copyright © 2019 Nicolás A. Rodríguez. All rights reserved.
//

import SwiftUI

extension Image {
    func fetchingRemoteImage(from url: String) -> some View {
        ModifiedContent(content: self, modifier: RemoteImageModifier(url: url))
    }
}
