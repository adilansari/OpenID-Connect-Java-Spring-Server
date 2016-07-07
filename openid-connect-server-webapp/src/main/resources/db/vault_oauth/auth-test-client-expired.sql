SET @clientDescription = 'Expired Access Token (valid 1 second)';
SET @clientId = 'nbPmMs1FXiDyoiAs3n16';
SET @clientSecret = '7IPr3hwcBxUAmTANqkvrj5dK7xZOVWLojb2OjJMT';
SET @idTokenSigningAlgorithm = 'HS256';
SET @openIdScope = 'openid';
SET @offlineAccessScope = 'offline_access';
SET @passwordGrantType = 'password';
SET @clientCredentialsGrantType = 'client_credentials';
SET @refreshTokenGrantType = 'refresh_token';

INSERT INTO client_details
  (client_description, client_id, client_secret, id_token_signed_response_alg, access_token_validity_seconds, refresh_token_validity_seconds)
SELECT
  @clientDescription, @clientId, @clientSecret, 'HS256', 1, 28800 FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_details WHERE client_id = @clientId);

SELECT id INTO @ownerId FROM client_details WHERE client_id = @clientId;

INSERT INTO client_scope
  (owner_id, scope)
SELECT
  @ownerId, @openIdScope FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_scope WHERE owner_id = @ownerId AND scope = @openIdScope);

INSERT INTO client_scope
  (owner_id, scope)
SELECT
  @ownerId, @offlineAccessScope FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_scope WHERE owner_id = @ownerId AND scope = @offlineAccessScope);

INSERT INTO client_grant_type
  (owner_id, grant_type)
SELECT
  @ownerId, @passwordGrantType FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_grant_type WHERE owner_id = @ownerId AND grant_type = @passwordGrantType);

INSERT INTO client_grant_type
  (owner_id, grant_type)
SELECT
  @ownerId, @clientCredentialsGrantType FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_grant_type WHERE owner_id = @ownerId AND grant_type = @clientCredentialsGrantType);

INSERT INTO client_grant_type
  (owner_id, grant_type)
SELECT
  @ownerId, @refreshTokenGrantType FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_grant_type WHERE owner_id = @ownerId AND grant_type = @refreshTokenGrantType);
