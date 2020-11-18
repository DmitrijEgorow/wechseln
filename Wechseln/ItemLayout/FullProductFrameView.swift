//
// Created by Dmitrii Chikovinskii on 27.10.2020.
//

import UIKit

class FullProductFrameView: UIView {

    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private lazy var fullDescriptionView = FullDescriptionView()

    private let actionButton = BottomActionButton()

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
        self.fullDescriptionView.set(text: viewModel.fullDescription)
        // self.actionButton.setTitle(viewModel.actionButtonText, for: .normal)

        self.setNeedsLayout()
    }

    private func setup() {
        // self.addSubview(self.imageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.shortDescriptionLabel)
        self.addSubview(self.fullDescriptionView)
        // self.addSubview(self.actionButton)

        self.imageView.contentMode = .scaleAspectFit
        self.imageView.layer.cornerRadius = 8.0
        self.imageView.clipsToBounds = true

        self.nameLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        self.nameLabel.numberOfLines = 0

        self.shortDescriptionLabel.font = UIFont.preferredFont(forTextStyle: .title3)

        self.backgroundColor = .white

//        self.fullDescriptionView.translatesAutoresizingMaskIntoConstraints = true
        self.fullDescriptionView.autoresizingMask = [.flexibleHeight]
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.imageView.frame = CGRect(x: 0, y: self.safeAreaInsets.top, width: self.frame.width, height: 200)

        let labelSideOffset: CGFloat = 16.0
        let availableSizeForLabel =
            CGSize(width: self.frame.width - labelSideOffset * 2, height: .greatestFiniteMagnitude)

        let nameLabelSize = self.nameLabel.sizeThatFits(availableSizeForLabel)
        self.nameLabel.frame.size = nameLabelSize
        self.nameLabel.frame.origin = CGPoint(
            x: labelSideOffset,
            y: self.imageView.frame.maxY + 24.0
        )
        
//        self.nameLabel.frame.origin = CGPoint(
//            x: labelSideOffset,
//            y: self.imageView.frame.origin.y + self.imageView.frame.size.height + 24.0)

        let shortDescriptionSize = self.shortDescriptionLabel.sizeThatFits(availableSizeForLabel)
        self.shortDescriptionLabel.frame.size = shortDescriptionSize
        self.shortDescriptionLabel.frame.origin = CGPoint(x: labelSideOffset, y: self.nameLabel.frame.maxY + 4.0)

        self.fullDescriptionView.frame.origin = CGPoint(x: labelSideOffset, y: self.shortDescriptionLabel.frame.maxY + 16.0)
        self.fullDescriptionView.frame.size =
            self.fullDescriptionView.systemLayoutSizeFitting(
                availableSizeForLabel,
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
        )
    }
}

