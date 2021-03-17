//
//  TeamsView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import SwiftUI

struct TeamsView: View {
    
    private let viewModel = TeamsViewModel()
    
    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 20, alignment: .center),
              count: layoutType.numberOfColumns)
    }
    
    @State private var isSheetPresented = false
    @State private var layoutType: LayoutType = .grid
    
    var body: some View {
        let data = viewModel.getTeams()
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data, id: \.id) { team in
                        if layoutType == .list {
                            NavigationLink(
                                destination: PlayersView(team: team)) {
                                TeamRowView(team: team)
                            }
                        } else {
                            NavigationLink(
                                destination: PlayersView(team: team)) {
                                TeamTileView(team: team)
                            }
                        }
                    }
                }.padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            }
            .padding(EdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0))
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("team-icon-emblem-default")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Teams").font(.headline)
                    }
                }
            })
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isSheetPresented.toggle()
                    }, label: {
                        Image("dashboard-layout")
                            .resizable()
                            .frame(width: 24, height: 24)
                    })
                    .actionSheet(isPresented: $isSheetPresented, content: {
                        ActionSheet(
                            title: Text("Layout"),
                            message: Text("Set desired layout"),
                            buttons: [
                                .default(Text("List"),
                                         action: {
                                            layoutType = .list
                                         }),
                                .default(Text("Grid"),
                                         action: {
                                            layoutType = .grid
                                         }),
                                .cancel()])
                    })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle()) // bug fix: https://stackoverflow.com/questions/63740788/swiftui-displaymodebuttonitem-is-internally-managed
    }
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: Color.secondaryText]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: Color.secondaryText]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .black
    }
}

enum LayoutType {
    
    case list, grid
    
    var numberOfColumns: Int {
        switch self {
        case .list:
            return 1
        case .grid:
            return 2
        }
    }
}

struct TeamListView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
