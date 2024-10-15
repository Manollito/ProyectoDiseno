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

    # Recibir mensaje de la cola
    def receive_message(self):
        response = self.sqs_client.receive_message(
            QueueUrl=self.queue_url,
            MaxNumberOfMessages=1,
            WaitTimeSeconds=10  # Tiempo de espera para mensajes
        )
        return response.get('Messages', [])
    
    # Eliminar el mensaje de SQS después de procesarlo
    def delete_message(self, receipt_handle):
        self.client.delete_message(
            QueueUrl=self.queue_url,
            ReceiptHandle=receipt_handle
        )
