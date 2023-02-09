from rest_framework import routers
from .views import WishItemViewSet
from django.urls import path, include


router = routers.DefaultRouter()
router.register(r'wishitems', WishItemViewSet)

urlpatterns = [path("", include(router.urls))]
