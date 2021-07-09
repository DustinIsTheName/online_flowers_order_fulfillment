class EmailsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:receive_order_created, :receive_ajax]

  def index

    @webhooks = Webhook.order("created_at DESC").all.limit(5)

    @ajax = AjaxRequest.order("created_at DESC").all.limit(5)

  end

  def receive_order_created

    head :ok, content_type: "text/html"
  
    webhook = Webhook.new(:hook_id => params[:id], :body => params)
    old_hook = Webhook.find_by_hook_id params[:id]

    unless old_hook
      if webhook[:body]["note"]
        unless webhook[:body]["note"].include? 'house_account:'
          if webhook.save!

            MercuryOrderMailer.send_order(webhook.body).deliver

          end
        end
      else
        if webhook.save!

          MercuryOrderMailer.send_order(webhook.body).deliver

        end
      end
    end
  end

  def receive_ajax

    ajax = AjaxRequest.new(:body => params)

    if ajax.save!

      MercuryOrderMailer.send_ajax_order(ajax.body).deliver

    end

    render :nothing => true, :status => 200

  end

end