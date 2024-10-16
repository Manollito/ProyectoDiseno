from repositories.medical_center_repository import MedicalCenterRepository

class CategorizationService:
  
    def categorize(self, evaluation_data, medical_center):
       
        # Obtener el método de categorización del centro médico
        #categorization_method = MedicalCenterRepository.get_categorization_method(medical_center)
        categorization_method = []
        # Proceso de categorización con el método adecuado
        
        for measure in categorization_method:
      
           """Se recorren los diferentes measures del centro medico con sus respectivos valores min y max
            y se categoriza.
            Además se realizan las conversiones de las unidades de los measures dependiendo de cada 
            centro médico (pulgadas, centimetros...)"""
           
           break

        result = ""
        
        return {"status": "Categorización completada", "result": result}
        