//
//  CreateTopicViewController.swift
//  DiscourseClient
//
//  Created by DAVID DE LA PUENTE on 20/7/21.
//

import UIKit

class CreateTopicViewController: UIViewController {

    @IBOutlet weak var textField: UITextField! {
        didSet{
            textField.placeholder = "Insert topic title and tap Submit"
        }
    }
    
    @IBOutlet weak var submitButton: UIButton! {
        didSet{
            submitButton.setTitle("Submit", for: .normal)
            submitButton.backgroundColor = .green
            submitButton.setTitleColor(.black, for: .normal)
            submitButton.layer.cornerRadius = 10
        }
    }
    
    let viewModel: CreateTopicViewModel
    
    init(viewModel: CreateTopicViewModel){
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
        viewModel.onCreateTopicSuccess = { [weak self]  in
            self?.hideLoader()
            self?.showAlert(title: "Topic guardado", message: "")
        }
        
        viewModel.onCreateTopicFail = { [weak self] error in
            self?.hideLoader()
            self?.showAlert(title: error, message: "")
        }
    }
    
    @IBAction func onTapSubmitButton(_ sender: UIButton) {
    
        guard let text = textField.text, !text.isEmpty else { showAlert(title: "No puede enviar un texto vacio", message: "")
            return
        }
            guard let textField =  textField.text else {return}
            viewModel.onTapSubmitButton(title: textField, raw: textField)
    }
}

extension CreateTopicViewController: CreateTopicViewProtocol {}

