////
////  UIViewControllerRepresentable.swift
////  PainT
////
////  Created by 최승희 on 6/3/24.
////
//
//import SwiftUI
//import UnityFramework
//
//struct UnityViewControllerRepresentable: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> UIViewController {
//        let unityViewController = UnityViewController()
//        return unityViewController
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//}
//
//class UnityViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        showUnity()
//    }
//
//    func showUnity() {
//        guard let ufw = loadUnityFramework() else { return }
//        let unityVC = ufw.appController()?.rootViewController
//        addChild(unityVC!)
//        unityVC!.view.frame = view.bounds
//        view.addSubview(unityVC!.view)
//        unityVC!.didMove(toParent: self)
//    }
//
//    func loadUnityFramework() -> UnityFramework? {
//        let bundlePath = Bundle.main.bundlePath
//        let frameworkPath = "\(bundlePath)/Frameworks/UnityFramework.framework"
//        let ufw = Bundle(path: frameworkPath)?.principalClass?.getInstance()
//        ufw?.setExecuteHeader(&_mh_execute_header)
//        ufw?.setDataBundleId("com.unity3d.framework")
//        ufw?.runEmbedded(withArgc: CommandLine.argc, argv: CommandLine.unsafeArgv, appLaunchOpts: nil)
//        return ufw
//    }
//}
//
