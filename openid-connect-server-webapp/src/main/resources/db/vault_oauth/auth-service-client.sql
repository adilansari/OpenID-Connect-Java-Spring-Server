SET @clientDescription = 'Auth Service';
SET @clientId = 'yftV40ow3JKi1s1gCVXt';
SET @clientSecret = 'Mc6SmE4d2BbIYO202KMiqI5Lx7JeU3WXiBh9FULl';
SET @idTokenSigningAlgorithm = 'HS256';
SET @clientCredentialsGrantType = 'client_credentials';

INSERT INTO client_details
  (client_description, client_id, client_secret, id_token_signed_response_alg, access_token_validity_seconds, refresh_token_validity_seconds)
SELECT
  @clientDescription, @clientId, @clientSecret, 'HS256', 900, 0 FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_details WHERE client_id = @clientId);

SELECT id INTO @ownerId FROM client_details WHERE client_id = @clientId;

INSERT INTO client_grant_type
  (owner_id, grant_type)
SELECT
  @ownerId, @clientCredentialsGrantType FROM DUAL
WHERE NOT EXISTS
  (SELECT NULL FROM client_grant_type WHERE owner_id = @ownerId AND grant_type = @clientCredentialsGrantType);

