import UIKit

class BagButton: UIButton {

    var bag: BagOutcomeButton

    init(frame: CGRect, bag: BagOutcomeButton) {
        self.bag = bag
        super.init(frame: .zero)

        tag = bag.rawValue
        layer.borderWidth = 2
        layer.cornerRadius = 24
        layer.borderColor = bag.buttonColor.cgColor
        backgroundColor = bag.populateAtStart ? bag.buttonColor : .white
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 48).isActive = true
        widthAnchor.constraint(equalToConstant: 48).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
