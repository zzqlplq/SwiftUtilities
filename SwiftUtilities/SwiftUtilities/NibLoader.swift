//
//  NibLoader.swift
//  SwiftUtilities
//
//  Created by 郑志强 on 2021/8/18.
//

import UIKit

protocol NibLoadable: AnyObject {
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension NibLoadable where Self: UIView {
    static func instantiate() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("nib \(self) load err ")
        }
        return view
    }
}


protocol NibOwnerLoadable: AnyObject {
    static var nib: UINib { get }
}

extension NibOwnerLoadable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension NibOwnerLoadable where Self: UIView {
    func loadNib() {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("nib \(self) load err ")
        }
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}

protocol StoryboardViewControllerLoabable {
    static var storyboardId: String { get }
}

extension StoryboardViewControllerLoabable {
    static var storyboardId: String {
        return String(describing: self)
    }
}

extension StoryboardViewControllerLoabable where Self: UIViewController {
    static func instantiate() -> Self {
        let stroyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = stroyboard.instantiateViewController(identifier: self.storyboardId) as? Self else {
            fatalError("viewController \(self) load err")
        }
        return viewController
    }
}
