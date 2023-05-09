//
//  UIButton+Extension.swift
//  CheckInternetApp
//
//  Created by Krasivo on 08.05.2023.
//

import UIKit

extension UIView {
    func addAction(_ closure: @escaping () -> Void) {
        addTargetWithClosure(isConnection: false, closure)
    }
    
    func addActionWithConnection(_ closure: @escaping () -> Void) {
        addTargetWithClosure(isConnection: true, closure)
    }
    
    private func addTargetWithClosure(isConnection: Bool, _ closure: @escaping () -> Void) {
        self.isUserInteractionEnabled = true
        final class ClosureConvert: UITapGestureRecognizer {
            private var closure: () -> Void
            private var isConnection: Bool

            init(_ isConnection: Bool, _ closure: @escaping () -> Void) {
                self.closure = closure
                self.isConnection = isConnection
                super.init(target: nil, action: nil)
                self.addTarget(self, action: #selector(execute))
            }

            @objc private func execute() {
                guard isConnection else {
                    closure()
                    return
                }
                self.checkConnection(closure)
            }
        }
        let click = ClosureConvert(isConnection, closure)
        self.addGestureRecognizer(click)
    }
}


extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping () -> Void) {
        if #available(iOS 14, *) {
            addAction(UIAction { (action: UIAction) in closure() }, for: controlEvents)
        } else {
            addTargetWithClosure(isConnection: false, closure)
        }
     }
    
    func addActionWithConnection(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping () -> Void) {
        if #available(iOS 14, *) {
            addAction(UIAction { [weak self] (action: UIAction) in
                self?.checkConnection(closure)
            }, for: controlEvents)
        } else {
            addTargetWithClosure(isConnection: true, closure)
        }
     }
    
    private func addTargetWithClosure(isConnection: Bool, _ closure: @escaping () -> Void) {
        @objc class ClosureConvert: NSObject {
            let closure: () -> Void
            let isConnection: Bool
            init(_ isConnection: Bool, _ closure: @escaping () -> Void) {
                self.closure = closure
                self.isConnection = isConnection
            }
            @objc func invoke() {
                guard isConnection else {
                    return
                }
                self.checkConnection(closure)
            }
        }
        let convert = ClosureConvert(isConnection, closure)
        addTarget(convert, action: #selector(ClosureConvert.invoke), for: .touchUpInside)
        let key = UUID()
        objc_setAssociatedObject(self, key.uuidString, convert, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

extension NSObject {
    func checkConnection(_ closure: @escaping () -> Void) {
        guard Reachability.isConnectedToNetwork() else {
            self.showWithoutEnternetAlert { [weak self] in self?.checkConnection(closure) }
            return
        }
        closure()
    }
    
    private func showWithoutEnternetAlert(closure: @escaping () -> Void) {
        
        guard
            let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let firstWindow = firstScene.windows.last
        else { return }

        let viewController = firstWindow.rootViewController
        let textManager: SferaMeetnetTextsManagerProtocol = SferaMeetnetTextsManager()
        
        let alertAction = UIAlertController(title: textManager.mnErrorConnectionTitle, message: textManager.mnErrorConnectionDescription, preferredStyle: .alert)
        alertAction.overrideUserInterfaceStyle = .light
        
        let cancelAction = UIAlertAction(title: textManager.mnErrorActionBack, style: .cancel)
        let tryAction = UIAlertAction(title: textManager.mnErrorActionTryagain, style: .default) { (action) in
            closure()
        }
        
        alertAction.addAction(tryAction)
        alertAction.addAction(cancelAction)
        
        tryAction.setValue(MeetNetColors.lightPrimary, forKey: "titleTextColor")
        cancelAction.setValue(MeetNetColors.lightPrimary, forKey: "titleTextColor")
    
        viewController?.present(alertAction, animated: true)
    }
}
