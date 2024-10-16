import boto3
import os
from django.http import JsonResponse
from rest_framework.views import APIView
from django.conf import settings
import tempfile
from aws_services.sqs_service import  SQSService
from .categorization_service import CategorizationService

class VideoEvaluationView(APIView):
    def post(self, request):

        client_id = request.data.get('client_id')  # Id del cliente al que se notifica por SNS
        scan_result = request.data.get('scan_result')  # Id del cliente al que se notifica por SNS
        medical_center = request.data.get('medical_center')  # Id del cliente al que se notifica por SNS

        # Enviar el resultado del scaneo a la cola de sqs
        """sqs_service = SQSService()
        message = {
            'scan_result': scan_result,
            'medical_center': medical_center,
            'client_id': client_id
        }
        sqs_service.send_message(message)"""

        return JsonResponse({'status': 'Evaluación en proceso, se notificará cuando esté lista.'})

    
