//
//  viewController.swift
//  PainT
//
//  Created by 최승희 on 6/3/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = UIHostingController(rootView: painRecordUnitySwiftUIView())
        addChild(vc)
        vc.view.frame = self.view.frame
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}
