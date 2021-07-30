//
//  CreateCategoryViewController.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 22/7/21.
//

import Foundation
import UIKit

class CreateCategoryViewController: UIViewController {
    @IBOutlet weak var textFieldNewCategory: UITextField!
    
    @IBOutlet weak var buttonNewCategory: UIButton!{
        didSet{
            buttonNewCategory.layer.cornerRadius = 10
        }
    }
    
    let viewModel: CreateCategoryViewModel
    
    init(viewModel: CreateCategoryViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    private func bindViewModel() {
        viewModel.onCreateCategorySuccess = { [weak self]  in
            self?.hideLoader()
            self?.showAlert(title: "Category saved", message: "OK")
        }
        
        viewModel.onCreateCategoryFail = { [weak self] error in
            self?.hideLoader()
            self?.showAlert(title: error, message: "")
        }
    }
    @IBAction func onTapButtonSendNewCategory(_ sender: Any) {
        guard let text = textFieldNewCategory.text, !text.isEmpty else { showAlert(title: "Please, fill the textfield", message: "")
            return
        }
        viewModel.onTapButtonSendNewCategory(category: text)
    }
}

extension CreateCategoryViewController: CreateCategoryViewProtocol {}
