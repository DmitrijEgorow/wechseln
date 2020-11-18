//
// Created by Дмитрий Егоров on 08.11.2020.
// Copyright (c) 2020 Home. All rights reserved.
//

import UIKit

final class BlockTapGestoreRecoginizer: UITapGestureRecognizer {
    private let action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action

        super.init(target: nil, action: nil)

        self.addTarget(self, action: #selector(onTap))
    }

    @objc
    private func onTap() {
        self.action()
    }
}
