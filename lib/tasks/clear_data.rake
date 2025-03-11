# frozen_string_literal: true

namespace :db do
  desc 'Очистить все данные, сбросить ID, но сохранить ar_internal_metadata'
  task clean: :environment do
    db_adapter = ActiveRecord::Base.connection.adapter_name.downcase

    ActiveRecord::Base.connection.disable_referential_integrity do
      ActiveRecord::Base.connection.tables.each do |table|
        next if table == 'schema_migrations' || table == 'ar_internal_metadata'

        ActiveRecord::Base.connection.execute("DELETE FROM #{table}")

        if db_adapter == 'sqlite'
          if ActiveRecord::Base.connection.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='sqlite_sequence'").any?
            ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='#{table}'")
          end
        elsif db_adapter == 'postgresql'

          ActiveRecord::Base.connection.reset_pk_sequence!(table)
        end

        puts "Таблица очищена и ID сброшены: #{table}"
      end
    end
  end
end
