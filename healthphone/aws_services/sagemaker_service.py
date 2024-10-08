import boto3
from django.conf import settings
import json

class SageMakerService:
    def __init__(self):
        self.sagemaker_runtime_client = boto3.client(
            'sagemaker-runtime',
            region_name=settings.AWS_REGION,
            aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
            aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY
        )
        self.endpoint_name = settings.SAGEMAKER_ENDPOINT_NAME

    def invoke_model(self, data):
        try:
            response = self.sagemaker_runtime_client.invoke_endpoint(
                EndpointName=self.endpoint_name,
                ContentType='application/json',
                Body=json.dumps(data)
            )
            result = json.loads(response['Body'].read().decode())
            return result
        except Exception as e:
            return {'error': str(e)}
