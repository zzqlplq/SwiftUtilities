//
//  Common.swift
//  SwiftUtilities
//
//  Created by 郑志强 on 2021/6/1.
//

import UIKit


extension UIColor {
    
    convenience init(r red: CGFloat, g green: CGFloat, b blue: CGFloat, a alpha: CGFloat = 1.0) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    
    static func hex(_ hex: Int64, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}



extension UIViewController {
    
    func endEditingWhenTap(_ tapGesture: ((_: UITapGestureRecognizer)-> Void)? = nil) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapHandle))
        if let block = tapGesture {
            block(tap)
        }
        self.view.addGestureRecognizer(tap)
    }
    
    @objc private func tapHandle() {
        self.view.endEditing(true)
    }
}


extension String {
    static var version: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
}

extension CGFloat {
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}



