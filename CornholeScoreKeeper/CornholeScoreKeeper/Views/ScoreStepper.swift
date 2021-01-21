import UIKit

class ScoreStepper: UIStepper {

    init(frame: CGRect, tag: Int = 0) {
        super.init(frame: frame)

        self.tag = tag
        self.value = 0
        self.stepValue = 1
        self.minimumValue = 0
        self.maximumValue = 4
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
