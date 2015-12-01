Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redistogo:f477bce7b333ec03d1543f3523443431@herring.redistogo.com:9889' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redistogo:f477bce7b333ec03d1543f3523443431@herring.redistogo.com:9889' }
end

Sidekiq.redis {|c| c.del('stat:failed') }
Sidekiq.redis {|c| c.del('stat:processed') }
