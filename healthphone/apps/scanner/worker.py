import boto3
from aws_services.sagemaker_service import SageMakerService
from aws_services.sqs_service import SQSService
from aws_services.sns_service import SNSService
from .services.categorization_service import CategorizationService

class Worker:
    def __init__(self):
        self.sqs_service = SQSService()
        self.sns_service = SNSService()

    def process_scan(self):
        # Proceso que se queda escuchando la cola SQS
        while True:
            message = self.sqs_service.receive_message()
            
            if message:
                video = message['Video']
                medical_center = message['medical_center']
                
                # Llamar a SageMaker para evaluar el video
                sagemaker_service = SageMakerService()
                evaluation_result = sagemaker_service.invoke_model(video)
                
                # Categorización basada en los resultados de SageMaker
                categorization_service = CategorizationService()
                categorization_result = categorization_service.categorize(evaluation_result, medical_center)
                
                # Notificar al cliente con SNS
                self.sns_service.notify_client(categorization_result)

                # Eliminar mensaje de la cola SQS una vez procesado
                self.sqs_service.delete_message(message['ReceiptHandle'])
