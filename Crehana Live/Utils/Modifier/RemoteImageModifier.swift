//
//  RemoteImageModifier.swift
//  Crehana Live
//
//  Created by Nicolás A. Rodríguez on 6/29/20.
//  Copyright © 2019 Nicolás A. Rodríguez. All rights reserved.
//

import SwiftUI
import class Kingfisher.KingfisherManager
import WidgetKit

struct RemoteImageModifier: ViewModifier {
    let url: String
    @State private var fetchedImage: UIImage? = nil

    func body(content: Content) -> some View {
        if let image = fetchedImage {
            return Image(uiImage: image)
                .resizable()
                .eraseToAnyView()
        }

        return content
            .onAppear(perform: fetch)
            .eraseToAnyView()
    }

    private func fetch() {
        guard let url = URL(string: url) else { return }
        KingfisherManager.shared.retrieveImage(with: url) { result in
            self.fetchedImage = try? result.get().image
            WidgetCenter.shared.reloadTimelines(ofKind: "AgendaDetailExtension")
        }
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
