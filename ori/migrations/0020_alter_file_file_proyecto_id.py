# Generated by Django 3.2.14 on 2022-11-06 17:44

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('ori', '0019_auto_20221105_1807'),
    ]

    operations = [
        migrations.AlterField(
            model_name='file',
            name='file_proyecto_id',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='ori.proyecto'),
        ),
    ]
