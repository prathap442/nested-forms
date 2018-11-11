class GuestsCleanupJob < ApplicationJob
  queue_as :default

  def perform(*args)
    binding.pry
    NotificationMailer.welcome(args[0]).deliver!
  end

  def perform_later(*args)
    binding.pry
    NotificationMailer.welcome(args[0]).deliver!  
  end

end
