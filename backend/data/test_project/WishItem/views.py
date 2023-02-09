from rest_framework import viewsets

from .models import WishItem
from .serializer import WishItemSerializer


class WishItemViewSet(viewsets.ModelViewSet):
    queryset = WishItem.objects.all()
    serializer_class = WishItemSerializer
