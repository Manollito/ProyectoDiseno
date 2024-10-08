import boto3
from django.conf import settings

class CognitoService:
    def __init__(self):
        self.client = boto3.client(
            'cognito-idp',
            region_name=settings.AWS_REGION,
            aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
            aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY
        )
        self.user_pool_id = settings.AWS_COGNITO_USER_POOL_ID
        self.client_id = settings.AWS_COGNITO_CLIENT_ID

    def authenticate_user(self, username, password):
        try:
            response = self.client.initiate_auth(
                AuthFlow='USER_PASSWORD_AUTH',
                AuthParameters={
                    'USERNAME': username,
                    'PASSWORD': password
                },
                ClientId=self.client_id
            )
            return response['AuthenticationResult']
        except self.client.exceptions.NotAuthorizedException:
            return {'error': 'Incorrect username or password'}
        except Exception as e:
            return {'error': str(e)}

    def get_user_info(self, access_token):
        try:
            response = self.client.get_user(
                AccessToken=access_token
            )
            return response['UserAttributes']
        except Exception as e:
            return {'error': str(e)}
