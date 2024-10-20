from django.db import models

class MedicalCenterModel(models.Model):
    medical_center = models.CharField(max_length=255)  # Nombre del centro médico
    site_name = models.CharField(max_length=255)  # Nombre del sitio dentro del centro médico
    scan_type = models.CharField(max_length=255)  # Nombre del valor a escanear (temperatura...)
    scan_type_id = models.IntegerField() # Id del valor a escanear (temperatura...)
    classification = models.CharField(max_length=255)  # Nombre de la clasificacion (verde...)
    subscription_id = models.IntegerField() # Id de la subscripción
    min_value = models.IntegerField() # Valor minimo en el que se debe de encontrar el resultado del
    # scaneo para pertenecer a la clasificación (verde, 10...)
    max_value = models.IntegerField() # Valor máximo en el que se debe de encontrar el resultado del
    # scaneo para pertenecer a la clasificación (verde, 20...)
    
    class Meta:
        db_table =  'medical_center'
