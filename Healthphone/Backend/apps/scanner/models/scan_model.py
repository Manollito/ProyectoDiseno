from django.db import models

class ScanModel(models.Model):
    id = models.AutoField(db_column='idEscaneo', primary_key=True)  # Definir idPaises como la clave primaria
    subscription_id = models.IntegerField() # Id de la subscripción
    scan_date = models.DateField() # Fecha del scaneo
    amIFaceId = models.IntegerField() # Id de la persona
    
    class Meta:
        managed = False  # Indica que no se debe crear ni modificar esta tabla en las migraciones
        db_table = 'Scaneo'  # Nombre de la vista"""