//
//  UIViewController+alert.swift
//  iOS-10-Sampler
//
//  Created by shf2 on 2016/10/14.
//  Copyright © 2016年 shf2. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, handler:((UIAlertAction) -> Swift.Void)? = nil) {

        DispatchQueue.main.async { [unowned self] in
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: handler))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
