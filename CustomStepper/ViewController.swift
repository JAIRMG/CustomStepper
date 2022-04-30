import UIKit

class ViewController: UIViewController {

  let customStepper: RoundStepper = {
    let blueOcean = UIColor(red: 20, green: 80, blue: 95)
    let stepper = RoundStepper(viewData: .init(color: blueOcean, minimum: 0, maximum: 100, stepValue: 10))
    stepper.translatesAutoresizingMaskIntoConstraints = false
    stepper.addTarget(self, action: #selector(didStepperValueChanged), for: .valueChanged)
    return stepper
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(customStepper)
    NSLayoutConstraint.activate([
      customStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      customStepper.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      customStepper.widthAnchor.constraint(equalToConstant: 210),
      customStepper.heightAnchor.constraint(equalToConstant: 70)
    ])
    
  }

  @objc private func didStepperValueChanged() {
    print("latest value: \(customStepper.value)")
  }

}

extension UIColor {
  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }
  
  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
}
