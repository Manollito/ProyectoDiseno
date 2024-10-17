import boto3
import os
from rest_framework.views import APIView
from django.http import HttpResponse
from django.conf import settings
import tempfile
from categorization_service import CategorizationService
from aws_services.sns_service import SNSService


class CategorizationView(APIView):
    def post(self, request):

        client_id = request.data.get('client_id')  # Id del cliente al que se notifica por SNS
        scan_result = request.data.get('scan_result')  # Resultado del scaneo de sagemaker
        medical_center = request.data.get('medical_center')  # Nombre del centro medico
        
        categorization_result = CategorizationService.categorize(scan_result, medical_center)
        
        sns_service = SNSService()
        sns_service.notify_client(categorization_result, client_id)

        return HttpResponse(status=204)  # 204 No Content

    
