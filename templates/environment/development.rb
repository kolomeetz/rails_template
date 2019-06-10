config.after_initialize do
  Bullet.enable = true
  Bullet.rails_logger = true
end

config.active_record.verbose_query_logs = false
