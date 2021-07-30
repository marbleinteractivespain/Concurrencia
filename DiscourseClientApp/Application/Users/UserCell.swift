//
//  UserCell.swift
//  DiscourseClientApp
//
//  Created by David de la Puente on 14/7/21.
//

import Foundation
import UIKit

class UserCell: UITableViewCell {
    var viewModel: UserCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.view = self
            textLabel?.text = viewModel.textLabel
            imageView?.image = viewModel.userImage
        }
    }
    
    func updateImageProperties(){
        imageView?.frame.size.width = 100
        imageView?.frame.size.height = 100
        imageView?.center = imageView?.center ?? CGPoint(x: 0, y: 0)
        imageView?.layer.cornerRadius = 25
        imageView?.layer.borderWidth = 3
        imageView?.layer.borderColor = CGColor(red: 255.0, green: 255.0, blue: 255.0, alpha:  1.0)
        imageView?.clipsToBounds = true
    }

}

extension UserCell: UserCellViewProtocol {
    func userImageFetched() {
        imageView?.image = viewModel?.userImage
        setNeedsLayout()
    }
}
