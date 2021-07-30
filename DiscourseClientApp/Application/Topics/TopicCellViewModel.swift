//
//  TopicCellViewModel.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import Foundation
import UIKit

protocol TopicCellViewProtocol: AnyObject {
    func topicImageFetched()
}

class TopicCellViewModel {
    weak var view: TopicCellViewProtocol?
    let topic: Topic
    let titleLabel: String?
    var topicImage: UIImage?
    let topicCreateAt: String?
    
    init(topic: Topic) {
        self.topic = topic
        self.titleLabel = topic.title
        self.topicCreateAt = topic.createdAt
    }
}
    
