//
//  CategoryDetailViewCController.swift
//  DiscourseClientApp
//
//  Created by DAVID DE LA PUENTE on 21/7/21.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var categoryIdLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var colorCcategoryView: UIView!{
        didSet{
            colorCcategoryView.backgroundColor = .black
        }
    }
    @IBOutlet weak var contraintHeightColorCategoryView: NSLayoutConstraint!{
        didSet{
            self.contraintHeightColorCategoryView.constant = ConstantsUI.kConstraintMin
        }
    }
    @IBOutlet weak var nameColorLabel: UILabel!{
        didSet{
            nameColorLabel.alpha = 0
            nameColorLabel.textColor = .white
            nameColorLabel.transform = CGAffineTransform(translationX: 0, y: -100)
        }
    }
    
    var bgColor: String?
    
    let viewModel: CategoryDetailViewModel
    
    init(viewModel: CategoryDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showLoader()
    }
    
    private func bindViewModel() {
        
        viewModel.onGetCategoryDetaillSuccess = { [weak self] categoryDetailViewStruct in
            self?.hideLoader()
            self?.updateUI(categoryDetailViewStruct: categoryDetailViewStruct)
        }
        viewModel.onGetCategoryDetailFail = { [weak self] in
            self?.hideLoader()
            self?.showAlert(title: "Error fetching category", message: "")
            
        }
    }
    
    private func updateUI(categoryDetailViewStruct: CategoryDetailViewStruct) {
        categoryIdLabel.text = categoryDetailViewStruct.categoryId
        categoryNameLabel.text = categoryDetailViewStruct.categoryName
        
        bgColor = "#\(categoryDetailViewStruct.categoryColor)"
        nameColorLabel.text = bgColor
        
        //Usamos la cola principal para animar la transicion de color de la view
        DispatchQueue.main.async {
            self.animateCategoryViewColor()
        }
    }
    
    private func animateCategoryViewColor(){
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {() -> Void in
            self.colorCcategoryView.backgroundColor =  UIColor.init(hexString: self.bgColor ?? "#FFFFFF")
            self.contraintHeightColorCategoryView.constant = ConstantsUI.kConstraintMax
            self.view.layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(withDuration: 0.8) {
                self.nameColorLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                self.nameColorLabel.alpha = ConstantsUI.kConstraintMax
            }
        })
    }
}
