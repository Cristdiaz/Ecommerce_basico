class CreateCategorias < ActiveRecord::Migration[7.0]
  def change
    create_table :categorias do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
