from repositories.scanner_repository import MedicalCenterRepository

class CategorizationService:
  
    def categorize(self, evaluation_data, medical_center):
       
        # Obtener el método de categorización del centro médico
        categorization_method = MedicalCenterRepository.get_categorization_method(medical_center)
        
        # Proceso de categorización con el método adecuado
        # En este caso, simplemente retorna el resultado categorizado
        return {"status": "Categorización completada", "result": evaluation_data}
        