class ScanResultModel(models.Model):
    scan_id  = models.IntegerField() # Id del scaneo
    scan_type_id = models.IntegerField() # Id del valor a escanear (temperatura...)
    result = models.FloatField() # Resultado del scaneo