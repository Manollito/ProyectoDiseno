from repositories.medical_center_repository import MedicalCenterRepository
from repositories.scan_repository import  ScanRepository


class CategorizationService:
    
    @staticmethod
    def categorize(scanner_result, organization, site):
        
        # Obtener el método de categorización del centro médico
        categorization_method = MedicalCenterRepository.get_categorization_method(site, organization)

        # Proceso de categorización con el método adecuado
        
        #ScanRepository.set_scan("subscription_id", "scan_date")  
        
        for measure in categorization_method:
      
            """Se recorren los diferentes measures del centro medico con sus respectivos valores min y max
            y se categoriza.
            Además se realizan las conversiones de las unidades de los measures dependiendo de cada 
            centro médico (pulgadas, centimetros...)"""
            
            #ScanRepository.set_scan_result("scan_type_id", "scan_id", "result")  
           
            break
        
      
        return categorization_method
        

        