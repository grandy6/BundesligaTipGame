class AddEvalutatedToMatches < ActiveRecord::Migration
  def change
  	add_column :matches, :evaluated, :boolean, :default => false
  end
end
