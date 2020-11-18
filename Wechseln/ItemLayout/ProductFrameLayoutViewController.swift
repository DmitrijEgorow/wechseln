//
// Created by Dmitrii Chikovinskii on 27.10.2020.
//

import UIKit

class ProductFrameLayoutViewController: UIViewController {

    private var productView: FullProductFrameView {
        self.view as! FullProductFrameView
    }

    override func loadView() {
        self.view = FullProductFrameView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Frame-layout example"

        let vm = FullProductViewModel.makeExample()
        self.productView.set(vm)
    }

}
