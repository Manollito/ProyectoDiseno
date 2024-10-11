import boto3
from django.conf import settings

class SNSService:
    def __init__(self):
        self.sns = boto3.client('sns', region_name=settings.AWS_REGION)
        self.topic_arn = settings.AWS_SNS_TOPIC_ARN
        
    def notify_client(self, message):
        response = self.sns.publish(
            TopicArn=self.topic_arn,
            Message=message,
            Subject='Evaluación Completada'
        )
        return response
