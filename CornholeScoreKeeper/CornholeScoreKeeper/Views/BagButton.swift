import UIKit

class BagButton: UIButton {

    var teamColor: UIColor

    init(frame: CGRect, color: UIColor) {
        self.teamColor = color
        super.init(frame: .zero)

        layer.borderWidth = 2
        layer.cornerRadius = 24
        layer.borderColor = color.cgColor
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 48).isActive = true
        widthAnchor.constraint(equalToConstant: 48).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
