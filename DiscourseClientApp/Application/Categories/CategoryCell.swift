//
//  CategoryCell.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 17/7/21.
//

import UIKit

class CategoryCell: UITableViewCell {
    var viewModel: CategoryCellViewModel? {
        didSet {
            guard viewModel != nil else { return }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Disable highlited on cell
        selectionStyle = .none
    
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
    }
    
    func configureCell(){
        guard let idCategory = viewModel?.idLabel else {return}
        guard let nameCategory = viewModel?.nameLabel else {return }
        
        textLabel?.text = "\(idCategory): \(nameCategory)"
        if let newColor = viewModel?.colorCell  {
            let bgColor = "#\(newColor)"
            self.backgroundColor = UIColor.init(hexString: bgColor)
        }
    }    
}
