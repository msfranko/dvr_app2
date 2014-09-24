Sequel.migration do
  up do
    create_table(:series_genre) do
      # String :viewer_id => :a0 REFERENCES viewers(id), :null => false
    end
  end

  down do
    drop_table(:series_genre)
  end
end

# Sequel.migration do
#   up do
#     create_table(:artists) do
#       primary_key :id
#       String :name, :null=>false
#     end
#   end

#   down do
#     drop_table(:artists)
#   end
# end
