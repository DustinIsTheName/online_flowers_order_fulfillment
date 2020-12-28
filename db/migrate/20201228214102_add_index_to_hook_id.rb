class AddIndexToHookId < ActiveRecord::Migration[6.0]
  def change
    add_index :webhooks, :hook_id, :unique => true
  end
end
