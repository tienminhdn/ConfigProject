//
//  UIViewExt.swift
//  ConfigProject
//
//  Created by T.Minh on 10/6/21.
//

import Foundation
import UIKit

extension UIView {

    struct AnchorOptions: OptionSet {

        let rawValue: Int

        init(rawValue: Int) {
            self.rawValue = rawValue
        }

        static let top = UIView.AnchorOptions(rawValue: 1 << 0)

        static let leading = UIView.AnchorOptions(rawValue: 1 << 1)

        static let trailing = UIView.AnchorOptions(rawValue: 1 << 2)

        static let bottom = UIView.AnchorOptions(rawValue: 1 << 3)

        static let all: UIView.AnchorOptions = [.top, .leading, .trailing, .bottom]
    }

    func anchorToSuperView(with insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        anchor(toView: superview, insets: insets)
    }

    func anchor(toView view: UIView?, insets: UIEdgeInsets = .zero, anchorOptions options: AnchorOptions = .all) {
        guard let view = view else { return }
        translatesAutoresizingMaskIntoConstraints = false

        if options.contains(.top) {
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        }
        if options.contains(.leading) {
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = true
        }
        if options.contains(.trailing) {
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right).isActive = true
        }
        if options.contains(.bottom) {
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).isActive = true
        }
    }

    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }

        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }

        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }

    func anchorToSuperViewLeading(with constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview.leadingAnchor,
                                 constant: constant).isActive = true
    }

    func anchorToSuperViewTrailing(with constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: superview.trailingAnchor,
                                  constant: constant).isActive = true
    }

    func anchorToSuperViewTrailing(lessThanOrEqual constant: CGFloat) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(lessThanOrEqualTo: superview.trailingAnchor,
                                  constant: constant).isActive = true
    }

    func anchorToSuperViewTop(with constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor,
                             constant: constant).isActive = true
    }

    func anchorToSuperViewTop(greaterThanOrEqual constant: CGFloat) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(greaterThanOrEqualTo: superview.topAnchor,
                             constant: constant).isActive = true
    }

    func anchorToSuperViewBottom(with constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: superview.bottomAnchor,
                                constant: constant).isActive = true
    }

    func anchorToSuperViewBottom(lessThanOrEqual constant: CGFloat) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(lessThanOrEqualTo: superview.topAnchor,
                                constant: constant).isActive = true
    }

    func anchorToSuperViewBottom(greaterThanOrEqual constant: CGFloat) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(greaterThanOrEqualTo: superview.topAnchor,
                                constant: constant).isActive = true
    }

    func heightAnchor(_ constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func widthAnchor(_ constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func centerVerticallyToSuperView(_ constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: constant).isActive = true
    }

    func centerHorrizontallyToSuperView(_ constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: constant).isActive = true
    }

    func removeMultiTouch() {
        subviews.forEach {
            $0.isExclusiveTouch = true
            $0.removeMultiTouch()
        }
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    public class func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    public class func loadNib<T: UIView>() -> T {
        let name = String(describing: self)
        let bundle = Bundle(for: T.self)
        guard let xib = bundle.loadNibNamed(name, owner: nil, options: nil)?.first as? T else {
            fatalError("Cannot load nib named \(name)")
        }
        return xib
    }

    public func border(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.cornerRadius = corner
        layer.masksToBounds = true
    }

    public var corner: CGFloat {
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.cornerRadius
        }
    }

    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        layer.maskedCorners = corners
    }

}

extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        layer.addSublayer(border)
    }

    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: frame.size.width - width, y: 0, width: width, height: frame.size.height)
        layer.addSublayer(border)
    }

    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: frame.size.height)
        layer.addSublayer(border)
    }

    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: width)
        layer.addSublayer(border)
    }
}

private struct UIViewKey {
    static var tapOnView = "tapOnView"
}

extension UIView {

    typealias Completion = (UIGestureRecognizer) -> Void

    private var tapGesture: Completion? {
        set {
            objc_setAssociatedObject(self, &UIViewKey.tapOnView, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &UIViewKey.tapOnView) as? Completion
        }
    }

    func tapGesture(completion: Completion? = nil) {
        self.tapGesture = completion
        let gesture = UITapGestureRecognizer(target: self, action: #selector(checkAction))
        addGestureRecognizer(gesture)
    }

    @objc func checkAction(sender: UITapGestureRecognizer) {
        tapGesture?(sender)
    }

    func takeScreenshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let image = image {
            return image
        }
        return UIImage()
    }
}
