from apps.scanner.models import ScanResultModel

class ScanRepository:
    @staticmethod
    def set_scan_result(scan_type_id, subscription_id, scan_date, result):
        
        result_scan =  ScanResultModel(scan_type_id, subscription_id, scan_date,  result)
        result_scan.save()

