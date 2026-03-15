# frozen_string_literal: true

class AddUserToBooks < ActiveRecord::Migration[7.0]
  def change
    # 1️⃣ Adiciona a coluna permitindo null
    add_reference :books, :user, null: true, foreign_key: true

    # 2️⃣ Preencher livros existentes com um user válido, usando update! para validar callbacks
    reversible do |dir|
      dir.up do
        default_user = User.first || User.create!(email: 'default@example.com', password: 'password')

        Book.find_each do |book|
          book.update!(user: default_user)
        end
      end
    end

    # 3️⃣ Torna a coluna NOT NULL depois de preencher
    change_column_null :books, :user_id, false
  end
end
