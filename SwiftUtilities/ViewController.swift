//
//  ViewController.swift
//  SwiftUtilities
//
//  Created by 郑志强 on 2021/6/1.
//

import UIKit

class ViewController: UIViewController {

    @UserDefaultsWrapped(key: "isFirstOpen", defaultValue: true)
    var isFirstOpen: Bool
    
    @UserDefaultsWrapped(key: "needRegister", defaultValue: true)
    var needRegister: Bool

    @UserDefaultsOptionalWrapped(key: "openDate")
    var token: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(needRegister)
        isFirstOpen = false
        print(isFirstOpen)

        print(token as Any)
        token = "this is token"
    }
}

