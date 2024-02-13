AUTHENTICATION_SOURCES = ['oauth2', 'internal']
OAUTH2_AUTO_CREATE_USER = True
OAUTH2_CONFIG = [{
    'OAUTH2_NAME' : 'authentik',
    'OAUTH2_DISPLAY_NAME' : 'SSO',
    'OAUTH2_CLIENT_ID' : '{{ .oidc_client_id }}',
    'OAUTH2_CLIENT_SECRET' : '{{ .oidc_client_secret }}',
    'OAUTH2_TOKEN_URL' : 'https://auth.monosense.io/application/o/token/',
    'OAUTH2_AUTHORIZATION_URL' : 'https://auth.monosense.io/application/o/authorize/',
    'OAUTH2_API_BASE_URL' : 'https://auth.monosense.io/',
    'OAUTH2_USERINFO_ENDPOINT' : 'https://auth.monosense.io/application/o/userinfo/',
    'OAUTH2_SERVER_METADATA_URL' : 'https://auth.monosense.io/application/o/pgadmin/.well-known/openid-configuration',
    'OAUTH2_SCOPE' : 'openid email profile',
    'OAUTH2_ICON' : 'fa-user-plus',
    'OAUTH2_BUTTON_COLOR' : '#fd4b2d'
}]
