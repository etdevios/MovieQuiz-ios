import UIKit

final class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol{
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var noButton: UIButton!
    @IBOutlet private weak var yesButton: UIButton!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    private var presenter: MovieQuizPresenter!
    private var alertPresenter: AlertPresenter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieQuizPresenter(viewController: self)
        alertPresenter = AlertPresenter(alertPresent: self)
    }
    
    // MARK: - Alert Present
    func presentAlert(_ alert: AlertModel) {
        alertPresenter?.showAlert(alert)
    }
    
    // MARK: - Actions
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        presenter.yesButtonClicked()
        sender.isEnabled = false
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        presenter.noButtonClicked()
        sender.isEnabled = false
    }
    
    // MARK: - Private functions
    func show(quiz step: QuizStepViewModel) {
        imageView.image = step.image
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
    }
    
    func hideBorder(){
        imageView.layer.borderWidth = 0
    }
    
    func activatedButton() {
        noButton.isEnabled = true
        yesButton.isEnabled = true
    }
    
    func highlightImageBorder(isCorrectAnswer: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrectAnswer ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
    }
    
    func hideLoadIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func showLoadingIndicator() {
        activityIndicator.startAnimating()
    }
    
}
