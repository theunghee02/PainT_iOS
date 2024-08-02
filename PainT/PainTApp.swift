//
//  PainTApp.swift
//  PainT
//
//  Created by 최승희 on 4/26/24.
//

import SwiftUI
import SwiftData
import UIKit
import UnityFramework

@main
struct PainTApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject private var appRootManager = AppRootManager()
    
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

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .splash
    
    enum eAppRoots {
        case splash
        case authentication
        case home
    }
}
//
//class AppDelegate: UIResponder, UIApplicationDelegate, UnityFrameworkListener   {
//    
//    var window: UIWindow?
//    var appLaunchOpts: [UIApplication.LaunchOptionsKey: Any]?
//    var didQuit: Bool = false
//    
//    @objc var unityFramework: UnityFramework?
//    
//    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        
//        unityFramework = getUnityFramework()
//        
//        appLaunchOpts = launchOptions
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: .main)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "Host")
//        
//        self.window = UIWindow.init(frame: UIScreen.main.bounds)
//        
//        if let nativeWindow = self.window {
//            nativeWindow.rootViewController = viewController;
//            nativeWindow.makeKeyAndVisible()
//        }
//        
//        return true
//    }
//    
//    func applicationWillResignActive(_ application: UIApplication) {
//        
//        if let unityFramework = self.unityFramework {
//            unityFramework.appController()?.applicationWillResignActive(application)
//        }
//        
//    }
//    
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        if let unityFramework = self.unityFramework {
//            unityFramework.appController()?.applicationDidEnterBackground(application)
//        }
//        
//    }
//    
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        if let unityFramework = self.unityFramework {
//            unityFramework.appController()?.applicationWillEnterForeground(application)
//        }
//    }
//    
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        
//        if let unityFramework = self.unityFramework {
//            unityFramework.appController()?.applicationDidBecomeActive(application)
//        }
//        
//    }
//    
//    func applicationWillTerminate(_ application: UIApplication) {
//        
//        if let unityFramework = self.unityFramework {
//            unityFramework.appController()?.applicationWillTerminate(application)
//        }
//    }
//    
//    // MARK: Unity API
//    
//    private func getUnityFramework() -> UnityFramework? {
//        let bundlePath: String = Bundle.main.bundlePath + "/Frameworks/UnityFramework.framework"
//        
//        let bundle = Bundle(path: bundlePath )
//        if bundle?.isLoaded == false {
//            bundle?.load()
//        }
//        
//        let ufw = bundle?.principalClass?.getInstance()
//        if ufw?.appController() == nil {
//            let machineHeader = UnsafeMutablePointer<MachHeader>.allocate(capacity: 1)
//            machineHeader.pointee = _mh_execute_header
//            
//            ufw!.setExecuteHeader(machineHeader)
//        }
//        return ufw
//    }
//    
//    func unityIsInitialized( ) -> Bool {
//        return (self.unityFramework != nil && self.unityFramework?.appController() != nil)
//    }
//    
//    func initUnity() {
//        
//        if let nativeWindow = self.window {
//            if unityIsInitialized() {
//                print("initUnity의 unityIsInitialized 상황")
//                return
//            }
//            
//            if didQuit {
//                print("initUnity의 didQuit 상황")
//                return
//            }
//            
//        }
//        
//        
//        self.unityFramework = getUnityFramework()
//        
//        if let unityframework = self.unityFramework {
//            unityframework.setDataBundleId("com.unity3d.framework")
//            unityframework.register(self)
//            NSClassFromString("FrameworkLibAPI")?.registerAPIforNativeCalls(self)
//            unityframework.runEmbedded(withArgc: CommandLine.argc, argv: CommandLine.unsafeArgv, appLaunchOpts: appLaunchOpts)
//            
//            attachUnityView()
//        }
//        
//        
//    }
//    
//    
//    func attachUnityView() {
//        
//        guard let unityRootView = unityFramework?.appController()?.rootView else {
//            return
//        }
//    }
//    
//    func unloadButtonTouched(_ sender: UIButton) {
//        unloadUnity()
//    }
//    
//    private func unloadUnityInternal() {
//        if let unityFramework = self.unityFramework {
//            unityFramework.unregisterFrameworkListener(self)
//            
//        }
//        self.unityFramework = nil
//        
//        if let nativeWindow = self.window {
//            nativeWindow.makeKeyAndVisible()
//        }
//        
//        
//    }
//    
//    private func unloadUnity() {
//        if !unityIsInitialized() {
//            print("!unityIsInitialized 상황")
//            return
//        } else {
//            if let unityFramework = getUnityFramework() {
//                unityFramework.unloadApplication()
//            }
//        }
//    }
//    
//    func unityDidUnload(_ notification: Notification!) {
//        unloadUnityInternal()
//    }
//    
//    func unityDidQuit(_ notification: Notification!) {
//        unloadUnityInternal()
//        self.didQuit = true
//    }
//    
//}
