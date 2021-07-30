//
//  UserCellViewModel.swift
//  DiscourseClientApp
//
//  Created by David de la Puente on 14/7/21.
//

import Foundation
import UIKit

protocol UserCellViewProtocol: AnyObject {
    func userImageFetched()
}

class UserCellViewModel {
    weak var view: UserCellViewProtocol?
    let user: User
    let textLabel: String?
    var userImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        textLabel = user.name ?? "Sin nombre"
        var imageStringURL = ConstantsApp.urlBase
        imageStringURL.append(user.avatarTemplate.replacingOccurrences(of: "{size}", with: "100"))
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let url = URL(string: imageStringURL), let data = try? Data(contentsOf: url) {
                self?.userImage = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.view?.userImageFetched()
                }
            }
        }
    }
    
}
