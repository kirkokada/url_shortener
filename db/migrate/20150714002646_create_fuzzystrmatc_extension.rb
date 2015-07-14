class CreateFuzzystrmatcExtension < ActiveRecord::Migration
  def change
    execute "create extension fuzzystrmatch"
  end
end
