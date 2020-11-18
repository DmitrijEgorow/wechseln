//
//  ProductViewController.swift
//  LayoutLecture5
//
//  Created by Dmitrii Chikovinskii on 25.10.2020.
//

import UIKit

class ProductViewController: UIViewController {

    private var productView: FullProductView {
        self.view as! FullProductView
    }
    
    override func loadView() {
        self.view = FullProductView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.setNavigationBarHidden(true, animated: false)

        self.title = "Perceive"

        let vm = FullProductViewModel.makeExample()
        self.productView.set(vm)
    }
}

