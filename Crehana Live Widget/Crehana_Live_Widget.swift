//
//  Crehana_Live_Widget.swift
//  Crehana Live Widget
//
//  Created by Nicolás A. Rodríguez on 6/29/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry
    let repository = LiveClassRepository()
    
    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), liveClass: .init(data: .init(nextLives: .init(edges: [.init(node: Node(originalID: 569, title: "El ABC para emprender un proyecto social", startLive: Date(), dueLive: Date(), videoProvider: "youtube", bannerMobileImageURL: "", liveDetailURL: "/live/el-abc-para-emprender-un-proyecto-social/")
        )])))
        )
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        repository.getAll { _liveClass, error in
            guard let liveClass = _liveClass else {
                let timeline = Timeline(entries: [
                    SimpleEntry(date: Date(), liveClass: .init(data: .init(nextLives: .init(edges: [])))
                    )
                ], policy: .atEnd)
                completion(timeline)
                return
            }
            let timeline = Timeline(entries: [SimpleEntry(date: Date(), liveClass: liveClass)], policy: .atEnd)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
    public let liveClass: LiveClass
}

struct PlaceholderView : View {
    var body: some View {
        Text("Placeholder View")
    }
}

struct Crehana_Live_WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            SmallWidget(live: entry.liveClass.data.nextLives.edges[0].node)
        case .systemMedium:
            MediumWidget(lives: entry.liveClass.data.nextLives.edges)
        case .systemLarge:
            LargeWidget(lives: entry.liveClass.data.nextLives.edges)
        @unknown default:
            Text("Default")
        }
    }
}

@main
struct Crehana_Live_Widget: Widget {
    private let kind: String = "Crehana_Live_Widget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            Crehana_Live_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Crehana Widget")
        .description("This is an Crehana widget.")
    }
}
