from rest_framework import serializers
from apps.scanner.models.medical_center_model import  MedicalCenterModel

class CategorizationSerializer(serializers.ModelSerializer):
    class Meta:
        model = MedicalCenterModel
        fields = [
            'nombre_sitio', 
            'nombre_organizacion', 
            'nombre_tipo_clasificacion', 
            'nombre_tipo_escaneo', 
            'valor', 
            'operador', 
            'nombre_tipo_unidad'
        ]