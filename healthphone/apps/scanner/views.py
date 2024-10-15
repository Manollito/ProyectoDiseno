import boto3
import os
from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.conf import settings
import tempfile
from aws_services.sqs_service import  SQSService
from aws_services.s3_service import  S3Service
from .services.categorization_service import CategorizationService
from .services.evaluation_service import  EvaluationService


class VideoEvaluationView(APIView):
    def post(self, request):

        # Recibir el key (nombre del archivo) del video a procesar desde Lambda

        #video_key = request.data.get('key')
        
        #s3Service =  S3Service()
           
        # Descargar el video desde S3 y los datos de cual centro medico lo subió
        
        #video = s3Service.download_video("key_video")
        #medical_center = s3Service.download_medical_center_data("key_video")
     
        """
    
        client_id = request.data.get('client_id')  # Id del cliente al que se notifica por SNS

        # Enviar el video a la cola SQS
        sqs_service = SQSService()
        message = {
            'video': video,
            'medical_center': medical_center,
            'client_id': client_id
        }
        sqs_service.send_message_to_queue(message)
        """

        return JsonResponse({'status': 'Evaluación en proceso, se notificará cuando esté lista.'})

    
