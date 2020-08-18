Aws.config.update({
  profile: 'netshare-staging',
  region: 'us-west-2'
})

require 'dynamoid'
Dynamoid.configure do |config|
  config.namespace = "dynamoid_staging"
end