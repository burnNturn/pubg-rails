class TelemetryWorker
  include Sidekiq::Worker

  def perform(*args)
    byebug
  end
end
