//
//  UserDetailViewModel.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 18/7/21.
//

import Foundation


protocol UserDetailViewProtocol: AnyObject {
    func onGetUserSuccess(userDetail: UserDetailViewStruct)
    func onGetUserFail()
    
    func onUpdateUserNameSuccess()
    func onUpdateUserNameFail()
    
}

struct UserDetailViewStruct {
    var userId: String?
    var nameLabel: String?
    var canEditName: Bool
    var imageAvatar: String?
}

class UserDetailViewModel: ViewModel {
    typealias View = UserDetailViewProtocol
    typealias Coordinator = UserDetailCoordinator
    typealias UseCases = UserDetailUseCases
    
    weak var view: UserDetailViewProtocol?
    var coordinator: UserDetailCoordinator?
    var useCases: UserDetailUseCases
    
    let username: String
    
    init(username: String, userDetailUseCases: UserDetailUseCases) {
        self.useCases = userDetailUseCases
        self.username = username
    }
    
    func viewDidLoad() {
        useCases.fetchUser(username: username) { [weak self] result in
            switch result {
            case .success(let response):
                guard let response = response else {return}
                let userDetailViewStruct = UserDetailViewStruct(userId: "\(response.user.id)", nameLabel: response.user.name, canEditName: response.user.canEditName, imageAvatar: response.user.imageAvatar)
                self?.view?.onGetUserSuccess(userDetail: userDetailViewStruct)
            case .failure:
                self?.view?.onGetUserFail()
            }
        }
    }
    func onTapeUpdateNameButton(name: String){
        useCases.updateUserName(username: username, name: name) { result in
            switch result{
            case .success:
                self.view?.onUpdateUserNameSuccess()
            case .failure:
                self.view?.onUpdateUserNameFail()
            }
        }
    }
}
