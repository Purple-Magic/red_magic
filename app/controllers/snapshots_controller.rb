class SnapshotsController < ApplicationController
  def create
    ReportJob.perform_later 
  end
end
