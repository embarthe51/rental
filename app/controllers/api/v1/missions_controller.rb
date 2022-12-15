class Api::V1::MissionsController < ApplicationController

  def index
    missions = Mission.all
    if missions
      render json: {status: "SUCCESS", message: "Fetched all the missions successfully", data: missions}, status: :ok
    else
      render json: missions.errors, status: :bad_request
    end
  end

end
