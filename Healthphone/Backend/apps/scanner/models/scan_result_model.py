from django.db import models

class ScanResultModel(models.Model):
    id = models.AutoField(db_column='idResultadoEscaneo', primary_key=True)  # Definir idPaises como la clave primaria
    scan_id  = models.IntegerField() # Id del scaneo
    scan_type_id = models.IntegerField() # Id del valor a escanear (temperatura...)
    value = models.FloatField() # Resultado del scaneo
    
    class Meta:
        managed = False  # Indica que no se debe crear ni modificar esta tabla en las migraciones
        db_table = 'ResultadoEscaneo'  # Nombre de la vista"""