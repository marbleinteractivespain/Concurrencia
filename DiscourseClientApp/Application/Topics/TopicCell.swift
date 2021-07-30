//
//  TopicCell.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import Foundation
import UIKit

class TopicCell: UITableViewCell {
    var viewModel: TopicCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            viewModel.view = self
            textLabel?.text = viewModel.titleLabel
            imageView?.image = viewModel.topicImage
            detailTextLabel?.text = viewModel.topicCreateAt?.subStringText(10)
        }
    }
}

extension TopicCell: TopicCellViewProtocol {
    func topicImageFetched() {
        imageView?.image = viewModel?.topicImage
        setNeedsLayout()
    }
}
