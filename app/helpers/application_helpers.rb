module ApplicationHelpers
  def sign_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def format_amount(amount)
    money = Money.from_amount(amount, "USD")
    money.format
  end

  def format_time(timestamp)
    # TODO: Support different user timezones
    timestamp.in_time_zone("America/New_York").strftime('%B %-d %Y, %l:%M:%S %p')
  end
end