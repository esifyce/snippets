//
//  Pannable.swift
//  MyBottomSheet
//
//  Created by Krasivo on 24.07.2022.
//

import UIKit

public extension Notification.Name {
    static var shouldEnablePannable: Notification.Name {
        return Notification.Name(rawValue: "shouldEnablePannable")
    }
}

public protocol Pannable {
    var panGestureRecognizer: UIPanGestureRecognizer { get }
    func bindEnablePannable()
}

public extension Pannable where Self: UIViewController {
    func bindEnablePannable() {
        NotificationCenter.default.addObserver(forName: .shouldEnablePannable, object: nil, queue: .main) {[weak self] in
            guard let shouldEnable = $0.object as? Bool else {
                return
            }
            self?.panGestureRecognizer.isEnabled = shouldEnable
        }
    }
}

public protocol PannableDelegate: AnyObject {
    func shouldEnablePannable(_ isEnable: Bool)
}

public extension PannableDelegate where Self: UIView {
    func shouldEnablePannable(_ isEnable: Bool) {
        NotificationCenter.default.post(name: .shouldEnablePannable, object: isEnable)
    }
}
