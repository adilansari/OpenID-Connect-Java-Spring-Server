SET @clientDescription = 'Mobile Client';
SET @clientId = 'xK9wmSX8vWyYSQ3D9BV7';
SET @clientSecret = 'Mct1T9AGMRa6UTUZd55yYuldn1kD1HIiuZt3V0k6';
SET @idTokenSigningAlgorithm = 'HS256';
SET @unauthenticatedEmailScope = 'untrusted_identities_email';
SET @registrationScope = 'registration';
SET @offlineAccessScope = 'offline_access';
SET @clientCredentialsGrantType = 'client_credentials';
SET @refreshTokenGrantType = 'refresh_token';

INSERT INTO client_details
  (client_description, client_id, client_secret, id_token_signed_response_alg, access_token_validity_seconds, refresh_token_validity_seconds)
SELECT
  @clientDescription, @clientId, @clientSecret, 'HS256', 600, 1200 FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_details WHERE client_id = @clientId);

SELECT id INTO @ownerId FROM client_details WHERE client_id = @clientId;

INSERT INTO client_scope
  (owner_id, scope)
SELECT
  @ownerId, @unauthenticatedEmailScope FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_scope WHERE owner_id = @ownerId AND scope = @unauthenticatedEmailScope);

INSERT INTO client_scope
  (owner_id, scope)
SELECT
  @ownerId, @registrationScope FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_scope WHERE owner_id = @ownerId AND scope = @registrationScope);

INSERT INTO client_scope
  (owner_id, scope)
SELECT
  @ownerId, @offlineAccessScope FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_scope WHERE owner_id = @ownerId AND scope = @offlineAccessScope);

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
