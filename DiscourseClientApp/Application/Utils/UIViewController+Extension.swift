//
//  UIViewController+Extension.swift
//  DiscourseClientApp
//
//  Created by David de la Puente on 15/7/21.
//

import UIKit
extension UIViewController {
    func showAlert(title: String, message:String, actionTitle: String = "Ok") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    func showLoader(){
        let loaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        loaderView.tag = 387
        loaderView.backgroundColor = .white
        
        let loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
        loader.center = loaderView.center
        loader.style = .large
        loader.color = .black
        loader.startAnimating()
        loaderView.addSubview(loader)
        view.addSubview(loaderView)
    }
    
    func hideLoader(){
        view.viewWithTag(387)?.removeFromSuperview()
    }
}
