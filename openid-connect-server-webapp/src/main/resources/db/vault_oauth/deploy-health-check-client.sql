SET @clientDescription = 'Deploy Health Check';
SET @clientId = 'Xd2g6z0TWoWISzvoQcxC';
SET @clientSecret = 'pqvZ13TcFzFYRMwQhx0mZyzqLvsreoKuTnoyQsD1';
SET @idTokenSigningAlgorithm = 'HS256';
SET @healthUpdateScope = 'health_update';
SET @clientCredentialsGrantType = 'client_credentials';

INSERT INTO client_details
  (client_description, client_id, client_secret, id_token_signed_response_alg, access_token_validity_seconds, refresh_token_validity_seconds)
SELECT
  @clientDescription, @clientId, @clientSecret, @idTokenSigningAlgorithm, 600, 0 FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_details WHERE client_id = @clientId);

SELECT id INTO @ownerId FROM client_details WHERE client_id = @clientId;

INSERT INTO client_scope
  (owner_id, scope)
SELECT
  @ownerId, @openIdScope FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_scope WHERE owner_id = @ownerId AND scope = @healthUpdateScope);

INSERT INTO client_grant_type
  (owner_id, grant_type)
SELECT
  @ownerId, @clientCredentialsGrantType FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_grant_type WHERE owner_id = @ownerId AND grant_type = @clientCredentialsGrantType);

