class CreateWebhooks < ActiveRecord::Migration[6.0]
  def change
    create_table :webhooks do |t|

      t.text :body

      t.string :hook_id

      t.timestamps null: false
    end
  end
end
