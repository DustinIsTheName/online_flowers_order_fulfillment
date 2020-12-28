class Function < ActiveRecord::Base

  def self.checkForWebhook
    shopify_shop='swenson-and-silacci-flowers.myshopify.com'
    shopify_api_key='4cc4f2b265e47caddfbf4fdab6c66b48'
    shopify_password='a6bff4ed6538965649c18c70bfe0f39f'

    ShopifyAPI::Base.site = "https://#{shopify_api_key}:#{shopify_password}@#{shopify_shop}/admin"

    webhooks = ShopifyAPI::Webhook.all
    found_webhook = false
    for webhook in webhooks
      if webhook.address == "https://swenson-silacci.herokuapp.com/order-creation"
        found_webhook = true
      end
    end

    unless found_webhook
      new_webhook = ShopifyAPI::Webhook.create({
        address: "https:\/\/swenson-silacci.herokuapp.com/order-creation",
        topic: "orders\/create",
        format: "json"
      })
      puts new_webhook
    else
      puts "found it"
    end
  end

end