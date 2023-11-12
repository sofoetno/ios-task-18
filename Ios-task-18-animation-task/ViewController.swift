import UIKit

class ViewController: UIViewController {
    private let tbcLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let centerYContraint = setupLabel()
        animateText(centerYContraint: centerYContraint)
    }
    
    func setupLabel() -> NSLayoutConstraint {
        tbcLabel.text = "TBC IT Academy"
        tbcLabel.textColor = UIColor(red: 0, green: 0.639, blue: 0.878, alpha: 1)
        tbcLabel.font = .systemFont(ofSize: 24, weight: .bold)
        tbcLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tbcLabel)
        
        let centerYContraint = tbcLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        NSLayoutConstraint.activate([
            tbcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerYContraint,
        ])
        
        tbcLabel.alpha = 0.0
        centerYContraint.constant += 50
        
        UIView.animate(withDuration: 0) { [weak self] in
            self?.view.layoutIfNeeded()
        }
        
        return centerYContraint
    }
    
    func animateText(centerYContraint: NSLayoutConstraint) {
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseOut, animations: { [weak self] in
            centerYContraint.constant -= 50
            self?.tbcLabel.alpha = 1.0
            self?.view.layoutIfNeeded()
        }, completion: { [weak self] _ in
            UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseOut, animations: {
                centerYContraint.constant += 50
                self?.tbcLabel.alpha = 0.0
                self?.view.layoutIfNeeded()
            }, completion: { [weak self] _ in
                self?.animateText(centerYContraint: centerYContraint)
            })
        })
    }
}

