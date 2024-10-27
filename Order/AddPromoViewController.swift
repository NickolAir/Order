import UIKit

class AddPromoViewController: UIViewController {
    
    private lazy var addPromoLabel: UILabel = {
        let label = UILabel()
        label.text = "Применить промокод"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(addPromoLabel)
        
        NSLayoutConstraint.activate([
            addPromoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            addPromoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            addPromoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}
