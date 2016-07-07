SET @clientDescription = 'Basic Test Client';
SET @clientId = '9YlZsuwk1p242fThLjyn';
SET @clientSecret = 'kqG7zoa7M4YFgbskFw4ntynHmyZeeMOMQTo8NE2x';
SET @idTokenSigningAlgorithm = 'HS256';
SET @openIdScope = 'openid';
SET @offlineAccessScope = 'offline_access';
SET @identityAdmin = 'identity:admin';
SET @unauthenticatedEmailScope = 'untrusted_identities_email';
SET @ssnScope = 'ssn';
SET @passwordGrantType = 'password';
SET @impersonateGrantType = 'impersonate';
SET @clientCredentialsGrantType = 'client_credentials';
SET @refreshTokenGrantType = 'refresh_token';

INSERT INTO client_details
  (client_description, client_id, client_secret, id_token_signed_response_alg, access_token_validity_seconds, refresh_token_validity_seconds)
SELECT
  @clientDescription, @clientId, @clientSecret, 'HS256', 900, 28800 FROM DUAL
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

INSERT INTO client_scope
  (owner_id, scope)
SELECT
  @ownerId, @identityAdmin FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_scope WHERE owner_id = @ownerId AND scope = @identityAdmin);

INSERT INTO client_scope
  (owner_id, scope)
SELECT
  @ownerId, @unauthenticatedEmailScope FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_scope WHERE owner_id = @ownerId AND scope = @unauthenticatedEmailScope);

INSERT INTO client_scope
  (owner_id, scope)
SELECT
  @ownerId, @ssnScope FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_scope WHERE owner_id = @ownerId AND scope = @ssn);

INSERT INTO client_grant_type
  (owner_id, grant_type)
SELECT
  @ownerId, @passwordGrantType FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_grant_type WHERE owner_id = @ownerId AND grant_type = @passwordGrantType);


INSERT INTO client_grant_type
  (owner_id, grant_type)
SELECT
  @ownerId, @impersonateGrantType FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_grant_type WHERE owner_id = @ownerId AND grant_type = @impersonateGrantType);

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
