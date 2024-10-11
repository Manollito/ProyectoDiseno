import boto3
import os
from django.http import JsonResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.conf import settings
import tempfile
from aws_services.sqs_service import  SQSService

from services import EvaluationService, CategorizationService

class VideoEvaluationView(APIView):
    def post(self, request):

        # Recibir el bucket y key (nombre del archivo) del video a procesar desde Lambda
      
        # Descargar el video desde S3 y los datos de cual centro medico lo subió
           
        video = request.data.get('video')  # Suponiendo que el video se envía en el cuerpo de la solicitud
        medical_center = request.data.get('medical_center')
        client_id = request.data.get('client_id')  # Suponiendo que tienes un ID del cliente

        # Enviar el video a la cola SQS
        sqs_service = SQSService()
        message = {
            'video': video,
            'medical_center': medical_center,
            'client_id': client_id
        }
        sqs_service.send_message_to_queue(message)

        return JsonResponse({'status': 'Evaluación en proceso, se notificará cuando esté lista.'})

    
