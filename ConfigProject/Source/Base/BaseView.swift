//
//  BaseView.swift
//  ConfigProject
//
//  Created by T.Minh on 10/6/21.
//

import Foundation

import UIKit

extension Bundle {

    func hasNib(name: String) -> Bool {
        return path(forResource: name, ofType: "nib") != nil
    }
}

protocol XibNameable {
    var xibName: String { get }
}

class BaseView: UIView, XibNameable {

    var xibName: String {
        return String(describing: type(of: self))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }

    private func loadNib() {
        let bundle = Bundle.main
        var xib: String?

        if bundle.hasNib(name: xibName) {
            xib = xibName
        }

        if let xib = xib, let view = bundle.loadNibNamed(xib, owner: self)?.first as? UIView {
            addSubview(view)
            view.anchorToSuperView()
        }
    }
}
