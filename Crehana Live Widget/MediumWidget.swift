//
//  MediumWidget.swift
//  Crehana Live
//
//  Created by Nicolás A. Rodríguez on 6/29/20.
//

import SwiftUI

struct MediumWidget: View {
    let lives: [Edge]
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(lives.prefix(2), id: \.self) { course in
                SmallWidget(live: course.node)
            }
        }
    }
}

struct MediumWidget_Previews: PreviewProvider {
    static var previews: some View {
        MediumWidget(lives: [])
    }
}
