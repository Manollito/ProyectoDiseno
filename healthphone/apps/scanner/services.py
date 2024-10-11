from aws_services.sagemaker_service import  SageMakerService
from repositories.scanner_repository import MedicalCenterRepository

class EvaluationService:
   
    def evaluate(self, video):
       
        # Llama a SageMaker con el video
        sagemaker_service = SageMakerService()
        result = sagemaker_service.invoke_model(video)
    
        # Devuelve el resultado de la evaluación
        return {"result": "result"}

class CategorizationService:
  
    def categorize(self, evaluation_data, medical_center):
       
        categorization_method = MedicalCenterRepository.get_categorization_method(medical_center)
        
        # Realiza el proceso de categorización basado en el metodo de categorización del centro médico
        
        return {"result": "result"}
        