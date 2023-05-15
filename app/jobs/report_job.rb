class ReportJob < ApplicationJob
  queue_as :default

  def perform
    text = ''

    Message.find_each { |message| text += message.text }

    Snapshot.create! text: text
  end
end
