import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var suitSelector: UISegmentedControl!
    @IBOutlet weak var valueSelector: UIStepper!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    var currentSuit: Int = 0 {
        didSet {
            switch suitSelector.selectedSegmentIndex {
            case 0:
                cardImage.image = #imageLiteral(resourceName: "heart")
            case 1:
                cardImage.image = #imageLiteral(resourceName: "spade")
            case 2:
                cardImage.image = #imageLiteral(resourceName: "club")
            case 3:
                cardImage.image = #imageLiteral(resourceName: "diamond")
            default:
                cardImage.image = #imageLiteral(resourceName: "heart")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperSetUp()
    }
    
    
    func stepperSetUp () {
        valueSelector.minimumValue = 1
        valueSelector.maximumValue = 13
        valueSelector.stepValue = 1
        valueSelector.value = 1
    }
    
    
    @IBAction func suitChanged(_ sender: UISegmentedControl) {
        currentSuit = sender.selectedSegmentIndex
    }
    
    @IBAction func valueStepped(_ sender: UIStepper) {
        if valueSelector.value <= 10 && valueSelector.value != 1 {
            topLabel.text = String(format: "%0.f", valueSelector.value)
        } else {
            switch valueSelector.value {
            case 1:
                topLabel.text = "A"
            case 11:
                topLabel.text = "J"
            case 12:
                topLabel.text = "Q"
            case 13:
                topLabel.text = "K"
            default:
                topLabel.text = "Impressive"
            }
        }
    }
    
    
    
}

