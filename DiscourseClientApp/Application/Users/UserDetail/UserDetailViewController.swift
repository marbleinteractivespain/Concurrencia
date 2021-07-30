//
//  UserDetailViewController.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 18/7/21.
//

import UIKit

class UserDetailViewController : UIViewController {
    
    lazy var labelUserIDValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userIDStackView: UIStackView = {
        let labelUserId = UILabel()
        labelUserId.translatesAutoresizingMaskIntoConstraints = false
        labelUserId.text = "User ID: "
        
        let stack = UIStackView(arrangedSubviews: [labelUserId, labelUserIDValue])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
    }()
    
    lazy var labelNameValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameStackView: UIStackView = {
        let labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.text = "User Name: "
        
        let stack = UIStackView(arrangedSubviews: [labelName, labelNameValue])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        
        return stack
    }()
    
    lazy var updateNameButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Update name", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(updateNameButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var textFieldUserName: UITextField = {
        let textfieldUsername = UITextField()
        textfieldUsername.borderStyle = .line
        textfieldUsername.translatesAutoresizingMaskIntoConstraints = false
        return textfieldUsername
    }()
    
    lazy var newUserNameStackView: UIStackView = {
        let labelNewName = UILabel()
        labelNewName.translatesAutoresizingMaskIntoConstraints = false
        labelNewName.text = "New User Name: "
        
        let stack = UIStackView(arrangedSubviews: [labelNewName, textFieldUserName])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    var imageAvatar: UIImageView = {
        let imgAvatar = UIImageView()
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.frame.size.width = 100
        imgAvatar.frame.size.height = 100
        imgAvatar.center = imgAvatar.center
        imgAvatar.layer.cornerRadius = 75
        imgAvatar.clipsToBounds = true
        
        return imgAvatar
    }()
    
    let viewModel: UserDetailViewModel
    
    init(viewModel: UserDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        view.addSubview(imageAvatar)
        NSLayoutConstraint.activate([
            imageAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageAvatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.addSubview(userIDStackView)
        NSLayoutConstraint.activate([
            userIDStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            userIDStackView.topAnchor.constraint(equalTo: imageAvatar.bottomAnchor, constant: 32)
        ])
        
        view.addSubview(nameStackView)
        NSLayoutConstraint.activate([
            nameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            nameStackView.topAnchor.constraint(equalTo: userIDStackView.bottomAnchor, constant: 32)
        ])
        
        view.addSubview(newUserNameStackView)
        NSLayoutConstraint.activate([
            newUserNameStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            newUserNameStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 32),
            textFieldUserName.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        view.addSubview(updateNameButton)
        NSLayoutConstraint.activate([
            updateNameButton.topAnchor.constraint(equalTo: newUserNameStackView.bottomAnchor, constant: 32),
            updateNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateNameButton.heightAnchor.constraint(equalToConstant: 40),
            updateNameButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showLoader()
    }
    
    @objc func updateNameButtonTapped() {
        guard let name = textFieldUserName.text, !name.isEmpty else { showAlert(title: "Error in textfield", message: "") ; return }
        
        viewModel.onTapeUpdateNameButton(name: name)
        
    }
    
    private func updateData(userDetail: UserDetailViewStruct) {
       
        var imageStringURL = ConstantsApp.urlBase
        imageStringURL.append(userDetail.imageAvatar?.replacingOccurrences(of: "{size}", with: "150") ?? "")
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let url = URL(string: imageStringURL), let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self?.imageAvatar.image = UIImage(data: data)
                    self?.labelUserIDValue.text = userDetail.userId
                    self?.labelNameValue.text = userDetail.nameLabel
                    
                }
            }
        }

        updateNameButton.isHidden = !userDetail.canEditName
        newUserNameStackView.isHidden = !userDetail.canEditName
        hideLoader()
    }
    
    private func showErrorFetchingUser() {
        showAlert(title: "Error fetching user", message: "")
        hideLoader()
    }
    
    private func showSuccessUserNameSuccess(){
        hideLoader()
        showAlert(title: "The user name has been successfully updated!!!", message: "")
    }
    private func showErrorUpdateUserNameFail(){
        hideLoader()
        showAlert(title: "Error updating user name", message: "")
    }
}


extension UserDetailViewController: UserDetailViewProtocol {
    func onUpdateUserNameSuccess() {
        showSuccessUserNameSuccess()
    }
    
    func onUpdateUserNameFail() {
        showErrorUpdateUserNameFail()
    }
    
    func onGetUserSuccess(userDetail: UserDetailViewStruct) {
        updateData(userDetail: userDetail)
    }
    
    func onGetUserFail() {
        showErrorFetchingUser()
    }
}
