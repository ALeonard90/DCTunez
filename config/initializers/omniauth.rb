Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "d3b607a52a504614a060e7ddd6291274", "a28a5071f4a74ed6b0d9643226e0012d", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
