# Generated by Django 4.1.5 on 2023-02-09 06:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Item', '0002_item_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='item',
            name='barcode',
            field=models.PositiveBigIntegerField(null=True),
        ),
    ]