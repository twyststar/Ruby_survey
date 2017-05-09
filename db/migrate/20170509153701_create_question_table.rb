class CreateQuestionTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |t|
      t.column(:q_text, :string)
      t.column(:survey_id, :integer)

      t.timestamps()
    end
  end
end
