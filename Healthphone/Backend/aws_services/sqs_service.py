import boto3
from django.conf import settings
class SQSService:
    def __init__(self):
        self.sqs_client = boto3.client('sqs', region_name=settings.AWS_REGION)
        self.queue_url = settings.AWS_SQS_URL  # Reemplaza con la URL de tu cola SQS

    # Enviar mensaje a la cola
    def send_message(self, message):
        response = self.sqs_client.send_message(
            QueueUrl=self.queue_url,
            MessageBody=json.dumps(message)
        )
        return response
