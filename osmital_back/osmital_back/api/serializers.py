from rest_framework import serializers
from osmital_app.models import hospital

class hospitalSerializer(serializers.ModelSerializer):
    class Meta:
        model = hospital
        fields = '__all__'