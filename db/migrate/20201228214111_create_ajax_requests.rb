class CreateAjaxRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :ajax_requests do |t|

      t.text :body

      t.timestamps null: false
    end
  end
end
