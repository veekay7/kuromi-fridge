from django.db import models


class Item(models.Model):
    REFRIGERATED = "refrigerated"
    FROZEN = "frozen"
    LOCATION_SET = (
            (REFRIGERATED, "refrigerated"),
            (FROZEN, "frozen"),
    )
    barcode = models.PositiveBigIntegerField(null=True)
    name = models.TextField()
    expire_date = models.DateField()
    location = models.CharField(choices=LOCATION_SET, max_length=16, null=True)
    image = models.ImageField(upload_to='images/', null=True)
    amount = models.PositiveIntegerField(null=True)
