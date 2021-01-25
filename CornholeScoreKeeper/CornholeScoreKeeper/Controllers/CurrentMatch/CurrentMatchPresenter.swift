import UIKit

protocol CurrentMatchPresenterType: UITableViewDataSource, ScoreOutcomeDelegate {

    func startNextFrame()
    func sendNewFrameData()
    func didTeamReachScoreLimit()
}

protocol CurrentMatchViewType {
    func showMatchDetails()
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
            bluePitcher: model.bluePitcher.player.name,
            redPitcher: model.redPitcher.player.name,
            blueTeam: model.currentMatch.blueTeam.score,
            redTeam: model.currentMatch.redTeam.score
        )
    }

    func didTeamReachScoreLimit() {
        recordFrameResults()
        if model.blueTeam.score < 21 && model.redTeam.score < 21 {
            startNextFrame()
        } else {
            model.currentMatch.setWinningTeam()
            // at some point, should add to match history archive.
            view.showMatchDetails()
        }

    }

    func startNextFrame() {
        model.currentMatch.currentFrameNumber += 1
        let frame = Frame(frame: model.currentMatch.currentFrameNumber, bluePitcher: FrameStat(), redPitcher: FrameStat())
        model.currentFrame = frame

        view.reloadFrameHistoryData()
        sendNewFrameData()
    }

    func recordFrameResults() {
        let currentFrame = model.currentFrame
        let pointsThisFrame = currentFrame.generateFrameScore()
        model.currentMatch.generateMatchSore(scoringTeam: currentFrame.scoringTeam, points: pointsThisFrame)

        model.redPitcher.incrementStats(with: currentFrame.redFrame)
        model.bluePitcher.incrementStats(with: currentFrame.blueFrame)
        model.currentMatch.frames.insert(currentFrame, at: 0)
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
        cell.bluePitcherLabel.text = model.bluePitcher.player.name
        cell.blueScoreLabel.text = "\(currentFrame.blueFrame.score)"
        cell.redPitcherLabel.text = model.redPitcher.player.name
        cell.redScoreLabel.text = "\(currentFrame.redFrame.score)"
        cell.frameNumberLabel.text = "Fr. \(currentFrame.frameNumber)"
        return cell
    }
}

extension CurrentMatchPresenter {
    func updateScoreModel(for stepperTag: ScoreStepperTag, with newValue: Int) {
        switch stepperTag {
        case .onBlue:
            model.currentFrame.blueFrame.onBoard = newValue
            view.updateScore(for: .onBlue, with: newValue, frameScore: model.currentFrame.blueFrame.score)
        case .inBlue:
            model.currentFrame.blueFrame.cornholes = newValue
            view.updateScore(for: .inBlue, with: newValue, frameScore: model.currentFrame.blueFrame.score)
        case .onRed:
            model.currentFrame.redFrame.onBoard = newValue
            view.updateScore(for: .onRed, with: newValue, frameScore: model.currentFrame.redFrame.score)
        case .inRed:
            model.currentFrame.redFrame.cornholes = newValue
            view.updateScore(for: .inRed, with: newValue, frameScore: model.currentFrame.redFrame.score)
        }
    }
}

