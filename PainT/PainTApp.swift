//
//  PainTApp.swift
//  PainT
//
//  Created by 최승희 on 4/26/24.
//

import SwiftUI
import SwiftData

@main
struct PainTApp: App {
    
    @StateObject  private  var appRootManager =  AppRootManager ()
    
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    splashSwiftUIView()
                    
                case .authentication:
                    loginSwiftUIView()
                    
                case .home:
                    tabSwiftUIView()
                }
            }
            .environmentObject(appRootManager)
        }
        .modelContainer(sharedModelContainer)
    }
}

extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
// 출처 https://green1229.tistory.com/298
extension View {
  @ViewBuilder public func overlayIf<T: View>(
    _ condition: Bool,
    _ content: T,
    alignment: Alignment = .center
  ) -> some View {
    if condition {
      self.overlay(content, alignment: alignment)
    } else {
      self
    }
  }
}
extension NavigationPath{
    func popToRoot() {
        self = NavigationPath()
    }
}

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .splash
    
    enum eAppRoots {
        case splash
        case authentication
        case home
    }
}
