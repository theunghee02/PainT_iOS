//
//  viewController.swift
//  PainT
//
//  Created by 최승희 on 6/3/24.
//

//import UIKit
//import SwiftUI
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let vc = UIHostingController(rootView: painRecordUnitySwiftUIView())
//        addChild(vc)
//        vc.view.frame = self.view.frame
//        view.addSubview(vc.view)
//        vc.didMove(toParent: self)
//    }
//}

import UIKit

class UnityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Unity view 설정
        Unity.shared.show()
        if let ufw = Unity.shared.ufw {
            let unityView = ufw.appController()?.rootView
            unityView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height) // 원하는 크기로 조정
            if let unityView = unityView {
                self.view.addSubview(unityView)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Unity.shared.show()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Unity.shared.unloadWindow()
    }
}
