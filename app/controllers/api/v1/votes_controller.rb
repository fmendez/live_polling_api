class Api::V1::VotesController < ApplicationController
  def create
    vote = Vote.new(vote_params)
    if vote.save
      poll = vote.option.poll
      ActionCable.server.broadcast(
        "poll_channel",
        {
          poll_id: poll.id,
          option_id: vote.option_id,
          votes_count: vote.option.votes.count
        }
      )
      render json: vote, status: :created
    else
      render json: vote.errors, status: :unprocessable_entity
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:option_id)
  end
end