from django.db import models


class WishItem(models.Model):
    name = models.TextField()
    amount = models.PositiveIntegerField(null=True)
