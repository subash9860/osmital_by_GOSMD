# from urllib import response
# from yaml import serialize
from rest_framework.response import Response
from rest_framework.decorators import api_view
from osmital_app.models import hospital
from .serializers import hospitalSerializer

@api_view(['GET'])
def getData(request):
    hospital1 = hospital.objects.all()
    serializer = hospitalSerializer(hospital1, many=True)
    fields = '__all__'
    return Response(serializer.data)
