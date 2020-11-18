//
//  FullProductView.swift
//  LayoutLecture5
//
//  Created by Dmitrii Chikovinskii on 25.10.2020.
//

import UIKit

struct FullProductViewModel {
    //let image: UIImage?
    let name: String
    let shortDescription: String
    let fullDescription: String
    // let actionButtonText: String

    static func makeExample() -> FullProductViewModel {
        FullProductViewModel(
                //image: UIImage(named: "product"),
                name: "Perceive",
                shortDescription: "to come to an opinion about something, or have a belief about something",
                fullDescription: "I perceived a note of unhappiness in her voice. \n\nPerceiving that he wasn't happy with the arrangements, I tried to book a different hotel."
                // actionButtonText: "Купить"
        )
    }
}

final class FullProductView: AutoLayoutView {

    // private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let shortDescriptionLabel = UILabel()// UILabel()
    private let fullDescriptionView = FullDescriptionView()

    // private let actionButton = BottomActionButton()

    init() {
        super.init(frame: .zero)

        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(_ viewModel: FullProductViewModel) {
        // self.imageView.image = viewModel.image
        self.nameLabel.text = viewModel.name
        self.shortDescriptionLabel.text = viewModel.shortDescription
        self.shortDescriptionLabel.numberOfLines = 0
        self.fullDescriptionView.set(text: viewModel.fullDescription)
        // self.actionButton.setTitle(viewModel.actionButtonText, for: .normal)
    }

    private func setup() {
        // self.addSubview(self.imageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.shortDescriptionLabel)
        self.addSubview(self.fullDescriptionView)
        // self.addSubview(self.actionButton)

//        self.imageView.contentMode = .scaleAspectFit
//        self.imageView.layer.cornerRadius = 32.0
//        self.imageView.clipsToBounds = true
//        self.imageView.layer.masksToBounds = false

        self.nameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
//        self.nameLabel.numberOfLines = 0

        self.shortDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        

        self.backgroundColor = .white
    }

    override func setupConstraints() {
        super.setupConstraints()

        [
            self.nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24.0),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16.0),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,  constant: -16.0),
            // self.nameLabel.heightAnchor.constraint(equalToConstant: 200),

            self.nameLabel.bottomAnchor.constraint(equalTo: self.shortDescriptionLabel.topAnchor, constant: -4.0),
            
            self.shortDescriptionLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 4.0),
            self.shortDescriptionLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            self.shortDescriptionLabel.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),

            self.fullDescriptionView.topAnchor.constraint(equalTo: self.shortDescriptionLabel.bottomAnchor, constant: 16.0),
            self.fullDescriptionView.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            self.fullDescriptionView.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),

        ].forEach { $0.isActive = true }

        // self.actionButton.attach(to: self)
    }
}
