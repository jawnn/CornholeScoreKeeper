import UIKit

protocol CurrentMatchPresenterType: UITableViewDataSource, ScoreOutcomeDelegate {

    func sendNewFrameData()
    func startNextFrame()
}

protocol CurrentMatchViewType {
    func reloadFrameHistoryData()
    func updateScore(for stepper: ScoreStepperTag, with value: Int, frameScore: Int)
    func populateViewsForNextFrame(bluePitcher name: String, redPitcher name: String, blueTeam score: Int, redTeam score: Int)
}

class CurrentMatchPresenter: NSObject, CurrentMatchPresenterType {
    var view: CurrentMatchViewType
    var model: CurrentMatchModelType

    init(model: CurrentMatchModelType, view: CurrentMatchViewType) {
        self.model = model
        self.view = view
    }

    func sendNewFrameData() {
        view.populateViewsForNextFrame(
            bluePitcher: model.currentFrame.bluePitcher.player.name,
            redPitcher: model.currentFrame.redPitcher.player.name,
            blueTeam: model.currentMatch.blueTeam.score,
            redTeam: model.currentMatch.redTeam.score
        )
    }

    func startNextFrame() {
        let currentFrame = model.currentFrame
        let pointsThisFrame = currentFrame.generateFrameScore()
        model.currentMatch.generateMatchSore(scoringTeam: currentFrame.scoringTeam, points: pointsThisFrame)

        guard model.blueTeam.score < 21 && model.redTeam.score < 21 else {
            print("a team has won")
            sendNewFrameData()
            return
        }

        model.currentMatch.currentFrameNumber += 1
        model.currentMatch.frames.insert(currentFrame, at: 0)
        let frame = Frame(frame: model.currentMatch.currentFrameNumber, bluePitcher: model.blueTeam.players[model.currentPitcherIndex], redPitcher: model.redTeam.players[model.currentPitcherIndex])
        model.currentFrame = frame

        view.reloadFrameHistoryData()
        sendNewFrameData()
    }

}

extension CurrentMatchPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.currentMatch.frames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FrameTableCell.self)) as? FrameTableCell else {
            return UITableViewCell()
        }

        let currentFrame = model.currentMatch.frames[indexPath.row]
        cell.layoutViewConfigurations(scoringTeam: currentFrame.scoringTeam)
        cell.frameOutcomeLabel.text = "+\(currentFrame.generatePlusMinus())"
        cell.bluePitcherLabel.text = currentFrame.bluePitcher.player.name
        cell.blueScoreLabel.text = "\(currentFrame.bluePitcher.frameScore)"
        cell.redPitcherLabel.text = currentFrame.redPitcher.player.name
        cell.redScoreLabel.text = "\(currentFrame.redPitcher.frameScore)"
        cell.frameNumberLabel.text = "Fr. \(currentFrame.frameNumber)"
        return cell
    }
}

extension CurrentMatchPresenter {
    func updateScoreModel(for stepperTag: ScoreStepperTag, with newValue: Int) {
        switch stepperTag {
        case .onBlue:
            model.currentFrame.bluePitcher.onThisFrame = newValue
            view.updateScore(for: .onBlue, with: newValue, frameScore: model.currentFrame.bluePitcher.frameScore)
        case .inBlue:
            model.currentFrame.bluePitcher.inThisFrame = newValue
            view.updateScore(for: .inBlue, with: newValue, frameScore: model.currentFrame.bluePitcher.frameScore)
        case .onRed:
            model.currentFrame.redPitcher.onThisFrame = newValue
            view.updateScore(for: .onRed, with: newValue, frameScore: model.currentFrame.redPitcher.frameScore)
        case .inRed:
            model.currentFrame.redPitcher.inThisFrame = newValue
            view.updateScore(for: .inRed, with: newValue, frameScore: model.currentFrame.redPitcher.frameScore)
        }
    }
}

