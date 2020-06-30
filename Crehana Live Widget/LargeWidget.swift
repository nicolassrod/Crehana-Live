//
//  LargeWidget.swift
//  Crehana Live
//
//  Created by Nicolás A. Rodríguez on 6/29/20.
//

import SwiftUI

struct LargeWidget: View {
    let lives: [Edge]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                SmallWidget(live: lives[0].node)
                SmallWidget(live: lives[1].node)
            }
            HStack(alignment: .center, spacing: 0) {
                SmallWidget(live: lives[2].node)
                SmallWidget(live: lives[3].node)
            }
        }
    }
}

struct LargeWidget_Previews: PreviewProvider {
    static var previews: some View {
        LargeWidget(lives: [])
    }
}
