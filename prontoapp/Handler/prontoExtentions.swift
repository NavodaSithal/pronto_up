//
//  prontoExtentions.swift
//  pronto
//
//  Created by Navoda on 10/3/21.
//

import Foundation
import UIKit

extension Date {
    
    var convertDateToString : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy h:mm a"
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
}

