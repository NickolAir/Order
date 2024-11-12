import UIKit

class CheckBox: UIButton {

    var isChecked: Bool = false {
        didSet {
            updateAppearance()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        self.addTarget(self, action: #selector(toggleCheck), for: .touchUpInside)
        updateAppearance()
    }
    
    private func updateAppearance() {
        if isChecked {
            self.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            self.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @objc private func toggleCheck() {
        isChecked.toggle()
    }
}
