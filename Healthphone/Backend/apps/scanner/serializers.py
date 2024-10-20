from rest_framework import serializers
from .models import ScanResultModel

class ScanResultSerializer(serializers.ModelSerializer):
    class Meta:
        model = ScanResultModel
        fields = ['scan_type_id', 'result']  # Campos a incluir en el JSON
