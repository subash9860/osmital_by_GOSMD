from django.db import models

# Create your models here.
class hospital(models.Model):
    name = models.CharField(max_length=200)
    beds = models.IntegerField()
    lat = models.FloatField()
    lon = models.FloatField()
    address = models.CharField(max_length=100)
    phone = models.IntegerField()
    email = models.EmailField()
    website = models.URLField()
    description = models.CharField(max_length=1000)