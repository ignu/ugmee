migration 1, :create_meetings do
  up do
create_table :meetings do
  column :id, Integer, :serial => true
  column :topic, "STRING"
      column :description, "STRING"
      column :date, "DATETIME"
end
  end

  down do
    drop_table :meetings
  end
end
