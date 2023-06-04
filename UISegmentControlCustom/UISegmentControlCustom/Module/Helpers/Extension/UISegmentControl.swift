//
//  UISegmentControl.swift
//  UISegmentControlCustom
//
//  Created by Krasivo on 01.06.2023.
//

import UIKit

extension UISegmentedControl {
    /// Используем для удаления UIImage background в UISegmentedControl
    func fixBackgroundColorWorkaround() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            for i in 0 ... (self.numberOfSegments-1) {
                let bg = self.subviews[i]
                bg.isHidden = true
            }
        }
    }
}
