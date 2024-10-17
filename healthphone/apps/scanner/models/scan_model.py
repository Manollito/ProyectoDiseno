class ScanModel(models.Model):
    subscription_id = models.IntegerField() # Id de la subscripción
    scan_date = models.DateField() # Fecha del scaneo