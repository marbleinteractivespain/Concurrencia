//
//  String+Extension.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 25/7/21.
//

import Foundation
import UIKit

extension String {
    func subStringText(_ n: Int) -> String {
        guard n >= 0 else {
            fatalError("n should never negative")
        }
        let index = self.index(self.startIndex, offsetBy: min(n, self.count))
        return String(self[..<index])
    }
}
