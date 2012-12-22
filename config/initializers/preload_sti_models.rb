if Rails.env.development?
  %w(registration baseball basketball football volleyball).each do |c|
    file = File.join("app", "models", "#{c}.rb")
    Rails.logger.info("  require_dependency #{file}")
    require_dependency file
  end
end