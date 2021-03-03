class MercuryOrderMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  # default to: 'mercury@onlineflowersorders.com'
  # default to: 'dustin@wittycreative.com'
  default_email = ENV["EMAIL"].blank? ? 'mercury2@onlineflowersorders.com' : ENV["EMAIL"]

  if Rails.env.development?
    default to: "dustin@wittycreative.com"
  else
    default to: default_email
  end

  def send_order(body)
    default_from_email = ENV["FROM_EMAIL"].blank? ? 'no-reply@onlineflowers.com' : ENV["FROM_EMAIL"]

    @body = body

    mail(from: default_from_email, subject: 'OnlineFlowers Order') do |format|
      format.text
    end

  end

  def send_ajax_order(body)
    default_from_email = ENV["FROM_EMAIL"].blank? ? 'no-reply@onlineflowers.com' : ENV["FROM_EMAIL"]

    @body = body

    mail(from: default_from_email, subject: 'OnlineFlowers Order') do |format|
      format.text
    end

  end

end
