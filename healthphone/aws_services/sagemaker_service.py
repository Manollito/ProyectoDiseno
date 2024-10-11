import boto3
from django.conf import settings
import json

class SageMakerService:
    def __init__(self):
        self.sagemaker_client = boto3.client(
            'sagemaker-runtime',
            region_name=settings.AWS_REGION,
            aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
            aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY
        )
        self.endpoint_name = settings.SAGEMAKER_ENDPOINT_NAME

    def invoke_model(self, video, categorization_method):
        
        result = {"result": "result"}
        
        return result