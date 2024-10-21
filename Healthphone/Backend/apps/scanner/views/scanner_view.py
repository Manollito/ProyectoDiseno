import boto3
import os
from django.http import JsonResponse
from rest_framework.views import APIView
from django.conf import settings
from rest_framework.response import Response
from rest_framework import status
import tempfile
from aws_services.sqs_service import  SQSService
from repositories.medical_center_repository import MedicalCenterRepository
from apps.scanner.serializers import CategorizationSerializer


class ScannerView(APIView):
    
    # Definir el servicio SQS como un atributo de clase
    #sqs_service = SQSService()
    
    def post(self, request):
      
        """client_id = request.data.get('client_id')  # Id del cliente al que se notifica por SNS
        bucket = request.data.get('bucket')
        object_key = request.data.get('object_key')
    
        # Enviar el resultado del scaneo a la cola de sqs
        
        message = {
            'client_id': client_id,
            'bucket': bucket,
            'object_key': object_key
        }
        sqs_service.send_message(message)"""
        
        return Response("Se realizó el proceso de escaneo, le avisaremos cuando esté listo", 
                        status=status.HTTP_200_OK)  # Devuelve los datos serializados


    
        