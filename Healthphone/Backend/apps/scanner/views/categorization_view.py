import boto3
import os
from rest_framework.views import APIView
from django.http import HttpResponse
from django.conf import settings
import tempfile
from django.http import JsonResponse
from apps.scanner.categorization_service import CategorizationService
from apps.scanner.serializers import  CategorizationSerializer
from aws_services.sns_service import SNSService

from rest_framework.response import Response
from rest_framework import status


class CategorizationView(APIView):
    
    #sns_service = SNSService()
    
    def post(self, request):

        """client_id = request.data.get('client_id')  # Id del cliente al que se notifica por SNS
        scan_result = request.data.get('scan_result')  # Resultado del scaneo de sagemaker
        medical_center = request.data.get('medical_center')  # Nombre del centro medico
        """
        
        organization = request.data.get('organization')
        site = request.data.get('site')
        
        categorization_result = CategorizationService.categorize("scanner_result", organization, site)
        
        result = CategorizationSerializer(categorization_result, many=True)
        
        #self.sns_service.notify_client(categorization_result, client_id)

        #return HttpResponse(status=204)  # 204 No Content
        
        return JsonResponse({"Resultado":  result.data})


    
