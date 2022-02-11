class AddPostgisExtensionToDatabase < ActiveRecord::Migration[7.0]
  # database user needs to be superuser or postgis extension needs to be trusted
  # e.g. SQL `alter user uprn with superuser`
  def change
    enable_extension 'postgis'
  end
end
