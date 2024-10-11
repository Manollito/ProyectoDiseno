from django.db import models

class MedicalCenterCategorization(models.Model):
    center_name = models.CharField(max_length=255)  # Nombre del centro médico
    categorization = models.CharField(max_length=255)  # Nombre del centro médico
    