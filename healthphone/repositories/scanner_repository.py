#from apps.scanner.models import 

class MedicalCenterRepository:
    @staticmethod
    def get_categorization_method(medical_center_id):
        # Recupera el centro médico por su ID y devuelve el método de categorización
       
        #medical_center = MedicalCenter.objects.get(id=medical_center_id)
        #return medical_center.categorization_method
        return {"result": "result"}