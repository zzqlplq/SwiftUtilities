//
//  AttributedString+Chaining.swift
//  SwiftUtilities
//
//  Created by 郑志强 on 2021/6/1.
//

import UIKit

protocol StringAttributedProtocol {

    var attributedString: NSAttributedString {get}

    func font(_ font: UIFont, range: NSRange?) -> NSAttributedString
    func fontSize(_ fontSize: CGFloat, range: NSRange?) -> NSAttributedString
    func foregroundColor(_ color: UIColor, range: NSRange?) -> NSAttributedString
    func backgroundColor(_ color: UIColor, range: NSRange?) -> NSAttributedString
    func underline(_ range: NSRange?, color: UIColor?) -> NSAttributedString
    func strikethrough(_ range: NSRange?, color: UIColor?) -> NSAttributedString
    func lineSpacing(_ lineSpacing: CGFloat, range: NSRange?) -> NSAttributedString
    func attribute(_ name: NSAttributedString.Key, value: Any, range: NSRange?) -> NSAttributedString
}


extension String: StringAttributedProtocol {

    func font(_ font: UIFont, range: NSRange? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.count)
        return attributedString.font(font, range: r)
    }
    
    func fontSize(_ fontSize: CGFloat, range: NSRange? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.count)
        return attributedString.fontSize(fontSize, range: r)
    }
    
    func foregroundColor(_ color: UIColor, range: NSRange? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.count)
        return attributedString.foregroundColor(color, range: r)
    }
    
    func backgroundColor(_ color: UIColor, range: NSRange? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.count)
        return attributedString.backgroundColor(color, range: r)
    }

    func underline(_ range: NSRange? = nil, color: UIColor? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.count)
        return attributedString.underline(r, color: color)
    }

    func strikethrough(_ range: NSRange? = nil, color: UIColor? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.count)
        return attributedString.strikethrough(r, color: color)
    }

    func lineSpacing(_ lineSpacing: CGFloat, range: NSRange? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.count)
        return attributedString.lineSpacing(lineSpacing, range: r)
    }
    
    func attribute(_ name: NSAttributedString.Key, value: Any, range: NSRange? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.count)
        return attributedString.attribute(name, value: value, range: r)
    }

}



extension NSAttributedString: StringAttributedProtocol {
    
    func font(_ font: UIFont, range: NSRange? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.length)
        let muAttr = NSMutableAttributedString(attributedString: self)
        muAttr.addAttribute(.font, value: font, range: r)
        return muAttr.attributedString
    }
    
    func fontSize(_ fontSize: CGFloat, range: NSRange? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.length)
        let font = UIFont.systemFont(ofSize: fontSize)
        let muAttr = NSMutableAttributedString(attributedString: self)
        muAttr.addAttribute(.font, value: font, range: r)
        return muAttr.attributedString
    }
    
    func foregroundColor(_ color: UIColor, range: NSRange? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.length)
        let muAttr = NSMutableAttributedString(attributedString: self)
        muAttr.addAttribute(.foregroundColor, value: color, range: r)
        return muAttr.attributedString
    }
    
    func backgroundColor(_ color: UIColor, range: NSRange? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.length)
        let muAttr = NSMutableAttributedString(attributedString: self)
        muAttr.addAttribute(.backgroundColor, value: color, range: r)
        return muAttr.attributedString
    }
    
    func underline(_ range: NSRange? = nil, color: UIColor? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.length)
        let muAttr = NSMutableAttributedString(attributedString: self)
        
        muAttr.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: r)

        if let color = color {
            muAttr.addAttribute(.underlineColor, value: color, range: r)
        }
        return muAttr.attributedString
    }

    func strikethrough(_ range: NSRange? = nil, color: UIColor? = nil) -> NSAttributedString {
        let r = range ?? NSRange(location: 0, length: self.length)
        let muAttr = NSMutableAttributedString(attributedString: self)
        muAttr.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: r)

        if let color = color {
            muAttr.addAttribute(.strikethroughColor, value: color, range: r)
        }
        return muAttr.attributedString
    }

    func lineSpacing(_ lineSpacing: CGFloat, range: NSRange? = nil) -> NSAttributedString {
            
        let r = range ?? NSRange(location: 0, length: self.length)
        let muAttr = NSMutableAttributedString(attributedString: self)
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = lineSpacing
        
        muAttr.addAttribute(.paragraphStyle, value: paragraph, range: r)
        return muAttr.attributedString
    }
    
    func attribute(_ name: Key, value: Any, range: NSRange? = nil) -> NSAttributedString {
        
        let r = range ?? NSRange(location: 0, length: self.length)
        let muAttr = NSMutableAttributedString(attributedString: self)
        muAttr.addAttribute(name, value: value, range: r)
        return muAttr.attributedString
    }
}


extension StringAttributedProtocol where Self == String {
    var attributedString: NSAttributedString {
        return NSAttributedString(string: self)
    }
}


extension StringAttributedProtocol where Self: NSAttributedString {
    var attributedString: NSAttributedString {
        if self is NSMutableAttributedString {
            return self.attributedSubstring(from: NSRange(location: 0, length: self.length))
        }
        return self
    }
}
