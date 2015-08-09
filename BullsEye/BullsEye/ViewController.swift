import UIKit

class ViewController: UIViewController {

    private var currentValue = 0
    private var targetValue = 0
    private var roundValue = 0
    private var scoreValue = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let roundScore = 100 - difference
        let message = "Target value: \(targetValue)"
            + "\nYour guess: \(currentValue)"
            + "\nScore: \(roundScore)"
        
        let alert = UIAlertController(title: "Hello, World!", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        scoreValue += roundScore
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(sender: UISlider) {
        currentValue = lroundf(sender.value)
    }
    
    private func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        roundValue++
        
        updateLabels()
    }
    
    private func updateLabels() {
        targetValueLabel.text = "\(targetValue)"
        roundLabel.text = "\(roundValue)"
        scoreLabel.text = "\(scoreValue)"
    }
}
