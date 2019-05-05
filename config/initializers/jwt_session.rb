JWTSessions.encryption_key = Rails.application.secrets.secret_jwt_encryption_key
JWTSessions.algorithm = "HS256"
JWTSessions.token_store = :redis, { redis_url: "redis://localhost:6397" } if Rails.env.production?
