import boto3
import os
from django.http import JsonResponse
from rest_framework.views import APIView
from django.conf import settings
import tempfile
from aws_services.sqs_service import  SQSService

class ScannerView(APIView):
    def post(self, request):

        client_id = request.data.get('client_id')  # Id del cliente al que se notifica por SNS
        bucket = request.data.get('bucket')
        object_key = request.data.get('object_key')
    
        # Enviar el resultado del scaneo a la cola de sqs
        """sqs_service = SQSService()
        message = {
            'client_id': client_id,
            'bucket': bucket,
            'object_key': object_key
        }
        sqs_service.send_message(message)"""

        return JsonResponse({'status': 'Evaluación en proceso, se notificará cuando esté lista.'})

    
