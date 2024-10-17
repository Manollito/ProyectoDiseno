from apps.scanner.models.scan_model import  ScanModel
from apps.scanner.models.scan_result_model import ScanResultModel

class ScanRepository:
    @staticmethod
    
    def set_scan(subscription_id, scan_date):
        
        result_scan =  ScanModel(subscription_id, scan_date)
        result_scan.save()
        
    def set_scan_result(scan_type_id, scan_id, result):
        
        result_scan =  ScanResultModel(scan_type_id, scan_id, result)
        result_scan.save()

