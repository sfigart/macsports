if Rails.env.development?
  %w[registration basketball volleyball].each do |c|
    require_dependency File.join("app", "models", "#{c}.rb")
  end
end