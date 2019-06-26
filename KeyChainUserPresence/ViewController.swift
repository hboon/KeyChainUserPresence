//
//  ViewController.swift
//  KeyChainUserPresence
//
//  Created by Hwee-Boon Yar on Jun/20/19.
//  Copyright © 2019 MotionObj. All rights reserved.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    private let keychain = KeychainSwift(keyPrefix: "testUserPresence")
    private let defaultKeychainAccess: KeychainSwiftAccessOptions = .accessibleWhenUnlockedThisDeviceOnly
    private let password = "pass456"
    private let key = "key456"
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let writeButton = UIButton(type: .system)
        writeButton.frame = CGRect(x: 10, y: 60, width: 100, height: 40)
        writeButton.setTitle("Write", for: .normal)
        writeButton.addTarget(self, action: #selector(write), for: .touchUpInside)
        view.addSubview(writeButton)
        
        let readButton = UIButton(type: .system)
        readButton.frame = CGRect(x: 10, y: 160, width: 100, height: 40)
        readButton.setTitle("Read", for: .normal)
        readButton.addTarget(self, action: #selector(read), for: .touchUpInside)
        view.addSubview(readButton)
    }
    
    @objc func write() {
        //hhh
        keychain.set(password, forKey: key, withAccess: defaultKeychainAccess)
        NSLog("Written")
    }
    
    @objc func read() {
        //hhh
        let value = keychain.get(key)
        NSLog("value: \(String(describing: value))")
    }
}
