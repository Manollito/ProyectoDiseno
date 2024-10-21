from django.db import models

class MedicalCenterModel(models.Model):
    id = models.AutoField(db_column='id', primary_key=True)  # Definir idPaises como la clave primaria
    nombre_sitio = models.CharField(max_length=255, db_column='Nombre_Sitio')
    nombre_organizacion = models.CharField(max_length=255, db_column='Nombre_Organizacion')
    nombre_tipo_clasificacion = models.CharField(max_length=255, db_column='Nombre_Tipo_Clasificacion')
    id_tipo_escaneo = models.IntegerField(db_column='ID_Tipo_Escaneo')
    nombre_tipo_escaneo = models.CharField(max_length=255, db_column='Nombre_Tipo_Escaneo')
    valor = models.FloatField(db_column='Valor')
    operador = models.CharField(max_length=10, db_column='Operador')
    nombre_tipo_unidad = models.CharField(max_length=255, db_column='Nombre_Tipo_Unidad')
    id_suscripcion = models.IntegerField(db_column='id_Suscripcion')
    class Meta:
        managed = False  # Indica que no se debe crear ni modificar esta tabla en las migraciones
        db_table = 'view_resultados'  # Nombre de la vista"""
