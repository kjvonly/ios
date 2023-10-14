//
//  SplashScreenView.swift
//  kjvonly
//
//  Created by man4christ on 10/14/23.
//

// Resources https://youtu.be/0ytO3wCRKZU
// SplashScreen for iOS in SwiftUI Tutorial 2022 (Xcode) chan: Indently

import SwiftUI


struct SplashScreenView: View {
    @State private var isActive: Bool = false
    @State private var size: Double = 0.6
    @State private var opacity: Double = 0.5
    let persistenceController = PersistenceController.shared

    var body: some View {
        if self.isActive {
            let bdao: BibleDao = BibleDao()
            let br: BibleRepository = BibleRepository(bibleDao: bdao)
            let bvm:            BibleViewModel = BibleViewModel(bibleRepository: br)
            BibleView(vm: bvm)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        else {
            VStack{
                Image("icon")
                VStack {
                    Text("KJVonly").font(Font.custom("Baskerville-Bold", size: 26)).foregroundStyle(.black.opacity(0.8))
                }
                .scaleEffect(size)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
      
    }
}


#Preview {
    SplashScreenView()
}
