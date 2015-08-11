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
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let roundScore = determineRoundScore()
        let message = "Target value: \(targetValue)"
            + "\nYour guess: \(currentValue)"
            + "\nScore: \(roundScore)"
        
        let alert = UIAlertController(title: getAlertHeader(roundScore), message: message, preferredStyle: .Alert)

        let action = UIAlertAction(title: "OK", style: .Default, handler: { action in self.startNewRound() })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        scoreValue += roundScore
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
    
    @IBAction func startNewGame() {
        roundValue = 0
        scoreValue = 0
        
        startNewRound()
    }
    
    private func updateLabels() {
        targetValueLabel.text = "\(targetValue)"
        roundLabel.text = "\(roundValue)"
        scoreLabel.text = "\(scoreValue)"
    }
    
    private func getAlertHeader(roundScore: Int) -> String {
        let title: String
        
        switch roundScore {
        case 100:
            title = "Perfect!"
        case let x where x > 90:
            title = "Almost!"
        default:
            title = "Not even close!"
        }
        
        return title
    }
    
    private func determineRoundScore() -> Int {
        let difference = abs(targetValue - currentValue)
        var roundScore = 100 - difference
        if roundScore == 100 {
            roundScore += 100
        }
        
        return roundScore
    }
}
