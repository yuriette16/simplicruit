class CreateEmailTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :email_templates do |t|
      t.string :subject
      t.text :body
      t.string :name

      t.timestamps
    end
  end
end
