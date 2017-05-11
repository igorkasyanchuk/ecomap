class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :identities do |t|
      t.string :uid
      t.string :provider
      t.references :user, index: true
      t.string :external_url

      t.timestamps
    end
  end
end
