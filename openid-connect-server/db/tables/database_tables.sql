CREATE TABLE access_token (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	token_value VARCHAR(4096),
	expiration TIMESTAMP,
	token_type VARCHAR(256),
	refresh_token_id VARCHAR(256),
	client_id VARCHAR(256),
	auth_holder_id VARCHAR(256),
	id_token_string VARCHAR(4096)
);

CREATE TABLE address (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	formatted VARCHAR(256),
	street_address VARCHAR(256),
	locality VARCHAR(256),
	region VARCHAR(256),
	postal_code VARCHAR(256),
	country VARCHAR(256)
);

CREATE TABLE allowed_scope (
	owner_id VARCHAR(256), 
	allowed_scope VARCHAR(256)
);

CREATE TABLE approved_site (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	user_id VARCHAR(256),
	client_id VARCHAR(256),
	creation_date DATE,
	access_date DATE,
	timeout_date DATE,
	whitelisted_site_id VARCHAR(256)
);

CREATE TABLE authentication_holder (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	owner_id VARCHAR(256),
	authentication LONGBLOB
);

CREATE TABLE authority (
	owner_id VARCHAR(4096),
	authority LONGBLOB
);

CREATE TABLE authorized_grant_type (
	owner_id VARCHAR(256),
	authorized_grant_type VARCHAR(2000)
);

CREATE TABLE client_details (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	client_description VARCHAR(256),
	allow_refresh TINYINT,
	allow_multiple_access_tokens TINYINT,
	reuse_refresh_tokens TINYINT,
	id_token_validity_seconds BIGINT,
	
	client_id VARCHAR(256),
	client_secret VARCHAR(2000),
	access_token_validity_seconds BIGINT,
	refresh_token_validity_seconds BIGINT,
	
	application_type VARCHAR(256),
	application_name VARCHAR(256),
	token_endpoint_auth_type VARCHAR(256),
	user_id_type VARCHAR(256),
	
	logo_url VARCHAR(256),
	policy_url VARCHAR(256),
	jwk_url VARCHAR(256),
	jwk_encryption_url VARCHAR(256),
	x509_url VARCHAR(256),
	x509_encryption_url VARCHAR(256),
	sector_identifier_url VARCHAR(256),
	
	requre_signed_request_object VARCHAR(256),
	
	user_info_signed_response_alg VARCHAR(256),
	user_info_encrypted_response_alg VARCHAR(256),
	user_info_encrypted_response_enc VARCHAR(256),
	user_info_encrypted_response_int VARCHAR(256),
	
	id_token_signed_response_alg VARCHAR(256),
	id_token_encrypted_response_alg VARCHAR(256),
	id_token_encrypted_response_enc VARCHAR(256),
	id_token_encrypted_response_int VARCHAR(256),
	
	default_max_age BIGINT,
	require_auth_time TINYINT,
	default_acr VARCHAR(256)
);

CREATE TABLE contact (
	owner_id VARCHAR(256),
	contact VARCHAR(256)
);

CREATE TABLE event (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	type INT(3),
	timestamp DATE
);

CREATE TABLE idtoken (
	id BIGINT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE idtokenclaims (
	id BIGINT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE redirect_uri (
	owner_id VARCHAR(256), 
	redirect_uri VARCHAR(2000) 
);

CREATE TABLE refresh_token (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	token_value VARCHAR(4096),
	expiration TIMESTAMP,
	client_id VARCHAR(256)
);

CREATE TABLE resource_id (
	owner_id VARCHAR(256), 
	resource_id VARCHAR(256) 
);

CREATE TABLE scope (
	owner_id VARCHAR(4096),
	scope VARCHAR(2048)
);

CREATE TABLE user_info (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	user_id VARCHAR(256),
	preferred_username VARCHAR(256),
	name VARCHAR(256),
	given_name VARCHAR(256),
	family_name VARCHAR(256),
	middle_name VARCHAR(256),
	nickname VARCHAR(256),
	profile VARCHAR(256),
	picture VARCHAR(256),
	website VARCHAR(256),
	email VARCHAR(256),
	email_verified BOOLEAN,
	gender VARCHAR(256),
	zone_info VARCHAR(256),
	locale VARCHAR(256),
	phone_number VARCHAR(256),
	address_id VARCHAR(256),
	updated_time VARCHAR(256)
);

CREATE TABLE whitelisted_site (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	creator_user_id VARCHAR(256),
	client_id VARCHAR(256)
);
