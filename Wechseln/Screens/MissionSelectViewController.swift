//
//  MissionSelectViewController.swift
//  Wechseln
//
//  Created by Дмитрий Егоров on 08.11.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

final class MissionSelectViewController: UIViewController { //CollectionViewController {
   
    private var mainView: MainView {
        self.view as! MainView
    }

    override func loadView() {
        self.view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.navigationItem.title = "WechseLn"
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))

        self.mainView.onTapAutoLayoutButton = { [weak self] in
            
//            self?.present(ProductViewController(), animated: true, completion: nil)
            self?.navigationController?.pushViewController(ProductViewController(), animated: true)
            
        }

//        self.mainView.onTapFrameButton = { [weak self] in
//            self?.navigationController?.pushViewController(ProductFrameLayoutViewController(), animated: true)
//        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    @objc
    private func didTapDone() {
        UIView.animate(withDuration: 0.5) {
            self.mainView.showFrameButton.isHidden = true
        }
    }
}

class MainView: AutoLayoutView {
    private let stackView = ScrollableStackView(config: .defaultVertical)

    let showAutoLayoutButton = UIButton(type: .system)
    let showFrameButton = UIButton(type: .system)

    var onTapAutoLayoutButton: (() -> Void)?
    var onTapFrameButton: (() -> Void)?

    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.showAutoLayoutButton.setTitle("Perceive", for: .normal)
//        self.showFrameButton.setTitle("Frame", for: .normal)

        self.stackView.addArrangedSubview(self.showAutoLayoutButton)
//        self.stackView.addArrangedSubview(self.showFrameButton)
        
//        for _ in 0...5 {
//            let view = UIView()
//            view.backgroundColor = .red
//            self.stackView.addArrangedSubview(view)
//            self.stackView.setCustomSpacing(8.0, after: view)
//            view.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        }

        self.showAutoLayoutButton.addTarget(self, action: #selector(onTapAutoLayout), for: .touchUpInside)
        self.showFrameButton.addTarget(self, action: #selector(onTapFrame), for: .touchUpInside)
    }

    override func setupConstraints() {
        super.setupConstraints()

        self.addSubview(self.stackView)

        self.stackView.pins(UIEdgeInsets(top: 100.0, left: 16.0, bottom: -30.0, right: -16.0))
    }

    @objc
    private func onTapAutoLayout() {
        self.onTapAutoLayoutButton?()
    }

    @objc
    private func onTapFrame() {
        self.onTapFrameButton?()
    }
}
