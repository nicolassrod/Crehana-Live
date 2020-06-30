//
//  SmallWidget.swift
//  Crehana Live
//
//  Created by Nicolás A. Rodríguez on 6/29/20.
//

import SwiftUI
import WidgetKit

struct SmallWidget: View {
    let live: Node
    
    var body: some View {
        ZStack {
            Image("crehana-logo")
                .resizable()
                .fetchingRemoteImage(from: live.bannerMobileImageURL ?? "")
                .scaledToFit()
                .scaleEffect(2)
            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom)
            VStack(alignment: .leading) {
                Spacer()
                Text(live.title ?? "")
                    .foregroundColor(.white)
                    .font(.system(.headline, design: .default))
                    .lineLimit(3)
                    .minimumScaleFactor(0.7)
                Label(title: {
                    Text(live.dueLive ?? Date(), style: .relative)
                        .foregroundColor(.white)
                        .font(.system(.title3, design: .default))
                        .minimumScaleFactor(0.15)
                }, icon: {
                    Image(systemName: "timer")
                        .foregroundColor(.white)
                }).labelStyle(CenteredLabelStyle())
            }.padding()
        }
        .clipped()
    }
}

struct CenteredLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
            configuration.title
        }
    }
}

struct SmallWidget_Previews: PreviewProvider {
    static var previews: some View {
        SmallWidget(live:
            Node(originalID: 569, title: "El ABC para emprender un proyecto social", startLive: Date(), dueLive: Date(), videoProvider: "youtube", bannerMobileImageURL: "https://crehana-public-catalog.imgix.net/images/live/banner_mobile/c391e188/el-abc-para-emprender-un-proyecto-social.png", liveDetailURL: "/live/el-abc-para-emprender-un-proyecto-social/")
        )
        .previewContext(WidgetPreviewContext(family: .systemSmall))
        .colorScheme(.dark)
    }
}


