import UIKit

struct AlertPresenter: AlertPresenterProtocol {
    
    weak var delegate: AlertPresenterDelegate?
    
    func show(quiz alert: QuizResultsViewModel, completion: ((UIAlertAction) -> Void)? = nil) {
        
        var result = convert(model: alert)
        result.completion = completion
        
        let alert = UIAlertController(
            title: result.title,
            message: result.message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: result.buttonText,
            style: .default,
            handler: result.completion
        )
        
        alert.addAction(action)
        delegate?.didShow(alert: alert)
    }
    
    private func convert(model: QuizResultsViewModel) -> AlertModel {
        let alertModel = AlertModel(
            title: model.title,
            message: model.text,
            buttonText: model.buttonText
        )
        return alertModel
    }
    
    
}
