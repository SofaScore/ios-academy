//
//  TeamsView.swift
//  SofaScoreAcademy
//
//  Created by Matija Kruljac on 05.03.2021..
//

import SwiftUI

struct TeamsView: View {
    
    @StateObject private var viewModel: TeamsViewModel
    
    @State private var isSheetPresented = false
    @State private var layoutType: LayoutType = .grid
    
    var body: some View {
        NavigationView {
            ScrollView {
                TeamsGridView(teams: viewModel.teams, layoutType: layoutType)
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
        .onAppear(perform: viewModel.getTeams)
    }
    
    init(viewModel: TeamsViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
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

struct TeamListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = TeamsViewModel()
        viewModel.teams = DataMocker().teams
        
        return TeamsView(viewModel: viewModel)
    }
}
