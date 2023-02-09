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
    status = models.CharField(choices=LOCATION_SET, max_length=16, null=True)
